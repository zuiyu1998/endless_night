extends Resource
class_name AttributeSet
# 属性集

@export
var data: Dictionary = {}

@export
var dependency_list: Array[AttributeDepender] = []

func get_attribute(name: String) -> Attrribute:
	return data[name]


func update_attribute_base_value(name:String, value: float):
	var attribute = get_attribute(name)
	if attribute:
		attribute.update_base_value(value)
		var list: Array[AttributeDepender] = dependency_list.filter(
			func (v:AttributeDepender): v.source_name = name
		)
		
		for dependency in list:
			var target_attribute = get_attribute(dependency.target_name)
			if target_attribute:
				dependency.on_update(target_attribute, value)
			else:
				printerr("Dependent attribute %s not found" % dependency.target_name)
	else:
		printerr("Attribute %s not found" % name)
		
