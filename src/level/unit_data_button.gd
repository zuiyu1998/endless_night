extends TextureButton
class_name UnitDataButton

signal item_data_selected(data: MapItemData)

@export
var data: MapItemData

func _on_pressed():
	item_data_selected.emit(data)

func _init() -> void:
	pressed.connect(_on_pressed)

func _ready() -> void:
	texture_normal = data.unit_icon
