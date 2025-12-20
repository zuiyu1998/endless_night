class_name AttrributeModifier
## 属性更改器，这是间接更改属性的唯一方式

enum ModifierOperation {
	# 绝对的
	Absolute,
	# 百分比
	Percentage,
	# 覆盖
	Overload
}

# 属性名称
var modifier_name: String

# 修改属性
var operation: ModifierOperation = ModifierOperation.Absolute
# 优先级
var priority: int = 0
# 数值
var value: float = 0.0
 
