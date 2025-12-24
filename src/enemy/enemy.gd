extends CharacterBody2D
class_name Enemy

@onready var skill_component: SkillComponent = $SkillComponent

var skill_system: SkillSystem

func apply_damage(damage: int):
	print("receive damage %s" % damage)
	var health = skill_component.health.get_value()
	print("health %s" % health)
	
	skill_component.health.update_value(health - damage)
	
	if skill_component.health.die():
		queue_free()
