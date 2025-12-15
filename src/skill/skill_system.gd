extends Node
class_name SkillSystem

var container: SkillEffectProcessorContainer = SkillEffectProcessorContainer.new()

func register(processor: ISkillEffectProcessor):
	container.register(processor)

func execute(skill: Skill, caster:ISkillComponent, target:ISkillComponent, payload:Dictionary):
	
	var context = SkillContext.new()
	context.caster = caster
	context.target = target
	context.scene_tree = get_tree()
	context.set_data(payload)
	
	var skill_commands = []
	for effect in skill.effects:
		var processor = container.get_processor(effect.effect_name)
		if processor:
			var skill_command = processor.process(effect, context)
			skill_commands.push_back(skill_command)
		else:
			printerr("%s processor not found." % effect.effect_name)
	
	for skill_command in skill_commands:
		skill_command.execute(caster)
		
