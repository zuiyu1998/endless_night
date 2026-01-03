extends MapItemFactory
class_name MapItemFactoryHill

var map_item_tscn = preload("res://src/map/item/map_item.tscn")
var hill_tscn = preload("res://src/map/tile/hill.tscn")


func get_map_item_name() -> String:
	return 'hill'

func spawn(data: Dictionary) -> MapItem:
	var map_item = map_item_tscn.instantiate() as MapItem
	var hill = hill_tscn.instantiate()
	
	var position = Vector2(data["position"]["x"], data["position"]["y"]) 
	
	map_item.add_child(hill)
	map_item.position = position
	
	return map_item
