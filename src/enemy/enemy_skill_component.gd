class_name EnemySkillComponent
extends ISkillComponent

var enemy: Enemy


func get_source_node2d() -> Node2D:
	return enemy


# 造成伤害
func apply_damage(damge: int):
	enemy.apply_damage(damge)


static func new_enemy_skill_component(p_enemy: Enemy) -> ISkillComponent:
	var skill_component = EnemySkillComponent.new()
	skill_component.enemy = p_enemy
	return skill_component
