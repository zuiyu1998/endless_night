extends Node
class_name SkillComponent

# 技能
var skill: Skill
# 属性
var attribute_set: AttributeSet 
# 体力值
var health: Health


func on_attribute_update(attribute_name: String, new_v: float, _old_v: float):
	if attribute_name == BattleConsts.MAX_HEALTH:
		health.update_max_value(int(new_v))


func mount():
	if not skill:
		printerr("skill component must have skill.")
		return
	if not attribute_set:
		printerr("skill component must have attribute set.")
		return
	if not health:
		printerr("skill component must have attribute health.")
		return
	
	attribute_set.attribute_update.connect(on_attribute_update)
	
	attribute_set.mount()
	pass
