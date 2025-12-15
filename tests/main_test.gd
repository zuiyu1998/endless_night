extends Node2D

@onready var skill_system: SkillSystem = $SkillSystem

@onready var arrow_tower: CharacterBody2D = $ArrowTower
@onready var square: CharacterBody2D = $Square

func initialize_skill_system():
	skill_system.register(BulletSkillEffectProcessor.new())

func _ready() -> void:
	initialize_skill_system()
	
	arrow_tower.skill_system = skill_system
