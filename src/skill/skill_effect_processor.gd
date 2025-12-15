class_name ISkillEffectProcessor

func effect_name() -> String:
	return ""

func process(_effect: SkillEffect, _context: SkillContext) -> ISkillCommand:
	return EmptySkillCommand.new()
