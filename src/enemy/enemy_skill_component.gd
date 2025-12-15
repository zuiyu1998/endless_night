class_name EnemySkillComponent
extends ISkillComponent

var enemy: Node2D

func get_source_node2d() -> Node2D:
	return enemy

static func new_enemy_skill_component(p_unit: Node2D) -> ISkillComponent:
	var skill_component = EnemySkillComponent.new()
	skill_component.enemy = p_unit
	return skill_component
