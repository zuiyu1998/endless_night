extends Resource
class_name Attrribute

@export
var attrribute_name: StringName = ""

@export
var default_value: float = 10.0:
	set(v):
		default_value = v
		update_base_value(v)
	

# 基础值
var _base_value: float = 0.0
# 当前值
var current_value: float = 0.0
# 修改器
var _modifiers: Array[AttrributeModifier] = []

func add_modifier_with_name(modifier: AttrributeModifier):
	var index = _modifiers.find(func (v: AttrributeModifier): return v.modifier_name == modifier.modifier_name)
	if index == -1:
		_modifiers.push_back(modifier)
	else:
		_modifiers[index] = modifier
	_recalculate_current_value()

func update_base_value(value: float):
	_base_value += value
	_recalculate_current_value()

func _recalculate_current_value():
	var value = _base_value
	
	var absolute_modifiers: Array[AttrributeModifier] = []
	var percentage_modifiers: Array[AttrributeModifier] = []
	var overload_modifier: AttrributeModifier = null
	
	for modifier in _modifiers:
		match modifier.operation:
			AttrributeModifier.ModifierOperation.Absolute:
				absolute_modifiers.push_back(modifier)
			AttrributeModifier.ModifierOperation.Percentage:
				percentage_modifiers.push_back(modifier)
			AttrributeModifier.ModifierOperation.Overload:
				if not overload_modifier:
					overload_modifier = modifier
				else:
					if modifier.priority > overload_modifier.priority:
						overload_modifier = modifier
	
	for modifier in absolute_modifiers:
		value += modifier.value
	
	var rate = 0.0
	for modifier in percentage_modifiers:
		rate += modifier.value
	
	var percentage = rate / 100.0 * _base_value
	value += percentage
	
	if overload_modifier:
		current_value = overload_modifier.value
	else:
		current_value = value
