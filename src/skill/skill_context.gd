class_name SkillContext

# 释放者
var caster: ISkillComponent
# 对象
var target: ISkillComponent

var scene_tree: SceneTree

var _data: Dictionary = {}

func set_data(data:Dictionary):
	_data = data

func get_value(key: String) -> Variant:
	return _data[key]

func set_value(key: String, value: Variant):
	_data[key] = value

func get_tree() -> SceneTree:
	return scene_tree
