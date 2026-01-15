extends ISkillEffectProcessor
class_name BulletSkillEffectProcessor


var ball_tscn = preload("res://src/bullet/ball/ball.tscn")

func effect_name() -> String:
	return "bullet"

func process(_effect: SkillEffect, context: SkillContext) -> ISkillCommand:
	var enemy = context.target.get_source_node2d()
	var bullet_position = context.get_value("bullet_position") as Vector2
	if enemy == null || bullet_position == null:
		return EmptySkillCommand.new()
	var direction = (enemy.global_position - bullet_position).normalized()
	
	var ball = ball_tscn.instantiate() as Ball
	ball.position = bullet_position
	ball.velocity = direction * 400
	
	var skill_command = BulletSkillCommand.new()
	skill_command.ball = ball
	
	return skill_command
