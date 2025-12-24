class_name ISkillComponent


func get_source_node2d() -> Node2D:
	return null


func get_tree() -> SceneTree:
	return null


# 造成伤害
func apply_damage(_damge: int):
	pass


func execute_command(command: ISkillCommand):
	command.execute(self)
