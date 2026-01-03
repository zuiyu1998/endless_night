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

# 地图方块的大小
@export
var cell_size: int = 128

# 地图方块之间的间隔
@export
var cell_space: int = 2

var container = MapItemFactoryContainer.new_map_item_factory_container()

var selected: Vector2i = Vector2i.ZERO

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
	var x = floori(local_position.x / (cell_size + cell_space)) as int
	var y = floori(local_position.y / (cell_size + cell_space)) as int
	
	return Vector2i(x, y)


func get_cell_position(x: int, y: int) -> Vector2:
	var postion_x = (cell_size + cell_space) * x
	var postion_y = (cell_size + cell_space) * y
	
	return Vector2(postion_x, postion_y)


func _ready() -> void:
	selected_sprite.visible = true
	for i in range(0, 10):
		for j in range(0, 10):
			var position = get_cell_position(i, j)
			add_map_cell({"map_item_name": "hill", "position": {"x":  position.x, "y": position.y }})
