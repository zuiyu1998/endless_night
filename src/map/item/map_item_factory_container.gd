class_name MapItemFactoryContainer
## 构建MapItem的容器

var data: Dictionary = {}


func register(factory: MapItemFactory):
	var item_name = factory.get_map_item_name()
	print_debug("%s map item factory is registered." % item_name)
	data[item_name] = factory


func get_factory(item_name: String) -> MapItemFactory:
	return data[item_name]


static func new_map_item_factory_container() -> MapItemFactoryContainer:
	var container = MapItemFactoryContainer.new()
	container.register(HillMapItemFactory.new())
	container.register(ArrowTowerMapItemFactory.new())
	
	return container
