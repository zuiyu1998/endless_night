extends Node
class_name SkillSystem

var container: SkillEffectProcessorContainer = SkillEffectProcessorContainer.new()

func register(processor: ISkillEffectProcessor):
	container.register(processor)

func execute(skill: Skill, caster:ISkillComponent, target:ISkillComponent, payload:Dictionary) -> Dictionary:
	var res = {}
	var context = SkillContext.new()
	context.caster = caster
	context.target = target
	context.scene_tree = get_tree()
	context.set_data(payload)
	
	for effect in skill.effects:
		var processor = container.get_processor(effect.effect_name)
		if processor:
			var effect_res = processor.process(effect, context)
			res[effect.effect_name] = effect_res
		else:
			printerr("%s processor not found." % effect.effect_name)
	return res
