class_name Health

signal value_update(value: int, max_value: int)

var _max_value: int = 10
var _value: int = 10

func emit_value_update():
	value_update.emit(_value, _max_value)

func die() -> bool:
	if _value <= 0:
		return true
	else:
		return false

func get_value() -> int:
	return _value


func update_value(v: int):
	var old_value = _value
	_value = clampi(v, 0, _max_value)
	if old_value != _value:
		emit_value_update()


func update_max_value(v: int):
	_max_value = v
	_value = clampi(_value, 0, _max_value)
	emit_value_update()
