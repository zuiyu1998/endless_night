extends Node2D

@onready var skill_system: SkillSystem = $SkillSystem


func initialize_skill_system():
	skill_system.register(BulletSkillEffectProcessor.new())

func _ready() -> void:
	initialize_skill_system()
	
