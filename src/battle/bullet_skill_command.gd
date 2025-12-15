extends ISkillCommand
class_name BulletSkillCommand

var ball: Ball

func execute(caster:ISkillComponent):
	caster.get_tree().current_scene.add_child(ball)
