extends CanvasLayer
class_name UnitDataCollectionPanel

@onready var v_box_container: VBoxContainer = $BoxContainer/MarginContainer/VBoxContainer

@export
var data: UnitDataCollection = UnitDataCollection.new(): set = set_data


# 选中item
signal item_data_selected(item: MapItemData)


func _on_item_data_selected(item: MapItemData):
	item_data_selected.emit(item)


func set_data(p_data: UnitDataCollection):
	data = p_data
	
	for map_item_data in data.items:
		var button = preload("res://src/level/unit_data_button.tscn").instantiate()
		button.data = map_item_data
		button.item_data_selected.connect(_on_item_data_selected)
		v_box_container.add_child(button)
		
