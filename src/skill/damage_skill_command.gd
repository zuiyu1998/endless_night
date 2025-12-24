extends ISkillCommand
class_name DamageSkillCommand

var damage: int = 0

func execute(caster:ISkillComponent):
	caster.apply_damage(damage)

static func new_damage_skill_command(p_damage: int):
	var skill_command = DamageSkillCommand.new()
	skill_command.damage = p_damage
	return skill_command
