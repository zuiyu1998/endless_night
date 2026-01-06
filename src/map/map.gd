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
var map_data: MapData = MapData.new()

var container = MapItemFactoryContainer.new_map_item_factory_container()

var selected: Vector2i = Vector2i.ZERO

# 生成塔
func spawn_unit():
	var position = get_cell_position(selected.x, selected.y)
	add_map_cell({
		"map_item_name": "arrow_tower",
		"position": {
			"x": position.x,
			"y": position.y
		}
	})


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("spawn_unit"):
		spawn_unit()


func _physics_process(_delta: float) -> void:
	if !selected_sprite.visible:
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
	var x = floori(local_position.x / (map_data.cell_size + map_data.cell_space)) as int
	var y = floori(local_position.y / (map_data.cell_size + map_data.cell_space)) as int
	
	return Vector2i(x, y)


func get_cell_position(x: int, y: int) -> Vector2:
	var postion_x = (map_data.cell_size + map_data.cell_space) * x
	var postion_y = (map_data.cell_size + map_data.cell_space) * y
	
	return Vector2(postion_x, postion_y)


func apply_map_data():
	if map_data == null:
		printerr("Map data must have.")
		return
	
	for map_cell_data in map_data.data:
		var position = get_cell_position(map_cell_data.x, map_cell_data.y)
		add_map_cell({"map_item_name": map_cell_data.map_item_name, "position": {"x":  position.x, "y": position.y }})


func _ready() -> void:
	apply_map_data()
