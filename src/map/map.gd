extends Node2D
class_name Map

@onready var body: Node2D = $Body
@onready var selected_sprite: Sprite2D = $SelectedSprite

# 地图大小, x
@export
var size_x: int = 9

# 地图大小, y
@export
var size_y: int = 9

@export
var data: MapData = MapData.new(): set = set_map_data

var container = MapItemFactoryContainer.new_map_item_factory_container()

var selected: Vector2i = Vector2i.ZERO
var selected_state: bool = false

func set_map_data(p_data: MapData):
	data = p_data
	for map_cell_data in data.items:
		var cell_position = get_cell_position(map_cell_data.x, map_cell_data.y)
		add_map_cell({"map_item_name": map_cell_data.map_item_name, "position": {"x":  cell_position.x, "y": cell_position.y }})


func _ready() -> void:
	set_selected_state(true)


# 设置地图的启用状态
func set_selected_state(v: bool):
	selected_state = v
	selected_sprite.visible = v

# 生成塔
func spawn_unit():
	var cell_position = get_cell_position(selected.x, selected.y)
	add_map_cell({
		"map_item_name": "arrow_tower",
		"position": {
			"x": cell_position.x,
			"y": cell_position.y
		}
	})


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("spawn_unit") and selected_state:
		spawn_unit()


func _physics_process(_delta: float) -> void:
	if !selected_state:
		return
	
	var local_position = get_local_mouse_position()
	var position_i = get_cell_position_i(local_position)
	selected_sprite.position = get_cell_position(position_i.x, position_i.y)
	selected = position_i


func add_map_cell(data: Dictionary):
	var factory = container.get_factory(data["map_item_name"])
	if factory == null:
		printerr("%s map item factory not found." % data["map_item_name"])
		return
	
	var map_item =  factory.spawn(data)
	body.add_child(map_item)


func get_cell_position_i(local_position: Vector2) -> Vector2i:
	var x = floori(local_position.x / (data.cell_size + data.cell_space)) as int
	var y = floori(local_position.y / (data.cell_size + data.cell_space)) as int
	
	return Vector2i(x, y)


func get_cell_position(x: int, y: int) -> Vector2:
	var postion_x = (data.cell_size + data.cell_space) * x
	var postion_y = (data.cell_size + data.cell_space) * y
	
	return Vector2(postion_x, postion_y)
