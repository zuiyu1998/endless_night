class_name SkillEffectProcessorContainer
## 技能处理器容器

var _data: Dictionary = {}

func register(processor: SkillEffectProcessor):
	print("%s SkillEffectProcessor register." % processor.effect_name)
	_data[processor.effect_name] = processor

func get_processor(effect_name: String) -> SkillEffectProcessor:
	return _data[effect_name]
