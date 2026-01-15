extends Node
class_name Level

@onready var unit_data_collection_panel: UnitDataCollectionPanel = $UnitDataCollectionPanel
@onready var map: Map = $Map

@export
var map_data: MapData = MapData.new()

@export
var unit_data_collection: UnitDataCollection = UnitDataCollection.new()


func _on_item_data_selected(item: MapItemData):
	map.spawn_unit()

func do_init():
	map.data = map_data
	unit_data_collection_panel.data = unit_data_collection
	unit_data_collection_panel.item_data_selected.connect(_on_item_data_selected)


func _ready() -> void:
	do_init()
