extends Resource
class_name AttributeSet
# 属性集

signal attribute_update(name: String, new_v: float, old_v: float)

@export
var data: Dictionary = {}

@export
var dependency_list: Array[AttributeDepender] = []

func mount():
	for attrribute in data.values():
		if attrribute is Attrribute:
			var new_v = attrribute.current_value
			attribute_update.emit(attrribute.attrribute_name, new_v, 0)
		else:
			printerr("attribute not found.")

func get_attribute(name: String) -> Attrribute:
	return data[name]


func update_attribute_base_value(name:String, value: float):
	var attribute = get_attribute(name)
	if attribute:
		var old_v = attribute.current_value
		attribute.update_base_value(value)
		var new_v = attribute.current_value
		if old_v != new_v:
			attribute_update.emit(name, new_v, old_v)
		
		var list: Array[AttributeDepender] = dependency_list.filter(
			func (v:AttributeDepender): v.source_name = name
		)
		
		for dependency in list:
			var target_attribute = get_attribute(dependency.target_name)
			if target_attribute:
				var target_old_v = target_attribute.current_value
				dependency.on_update(target_attribute, value)
				var target_new_v = target_attribute.current_value
				if old_v != new_v:
					attribute_update.emit(target_attribute.attrribute_name, target_new_v, target_old_v)
			else:
				printerr("Dependent attribute %s not found" % dependency.target_name)
	else:
		printerr("Attribute %s not found" % name)
		
