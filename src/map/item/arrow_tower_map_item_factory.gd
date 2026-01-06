extends MapItemFactory
class_name ArrowTowerMapItemFactory

const arrow_tower_tscn = preload("res://src/unit/arrow_tower/arrow_tower.tscn")

func get_map_item_name() -> String:
	return 'arrow_tower'

func spawn(data: Dictionary) -> MapItem:
	var position = Vector2(data['position']['x'], data['position']['y'])
	var arrow_tower = arrow_tower_tscn.instantiate()
	var item = MapItem.new()
	item.add_child(arrow_tower)
	item.position = position
	
	return item
