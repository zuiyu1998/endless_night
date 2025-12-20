extends Resource
class_name AttributeDepender
# 属性依赖器，用于某一属性更改时，对其他属性的改变


# 源属性
@export
var source_name: String = ""

# 目标属性
@export
var target_name: String = ""

# 影响的系数
@export
var rate: float = 1.0

# 对目标属性的更改
func on_update(target_attribute: Attrribute, value: float):
	var modifier = AttrributeModifier.new()
	modifier.modifier_name = depend_key()
	modifier.operation = AttrributeModifier.ModifierOperation.Absolute
	modifier.value = rate * value
	target_attribute.add_modifier_with_name(modifier)


func depend_key() -> String:
	return "__inline_" + source_name + target_name
	
