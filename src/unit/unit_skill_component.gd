class_name UnitSkillComponent
extends ISkillComponent

var unit: Node2D

func get_source_node2d() -> Node2D:
	return unit
	
func get_tree() -> SceneTree:
	return unit.get_tree()

static func new_unit_skill_component(p_unit: Node2D) -> ISkillComponent:
	var skill_component = UnitSkillComponent.new()
	skill_component.unit = p_unit
	return skill_component
