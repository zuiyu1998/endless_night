extends Node2D

var skill_system: SkillSystem = SkillSystem.new()

func initialize_skill_system():
	skill_system.register(BulletSkillEffectProcessor.new())

func _ready() -> void:
	initialize_skill_system()
