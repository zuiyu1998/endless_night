extends Enemy
class_name Square

@onready var hurtbox: Hurtbox = $Hurtbox

func _ready() -> void:
	skill_component.skill = preload("res://src/enemy/square/square_skill.tres").duplicate(true)
	skill_component.attribute_set = preload("res://src/enemy/square/square_attribute_set.tres").duplicate(true)
	skill_component.health = Health.new()
	skill_component.mount()
	
	hurtbox.source = EnemySkillComponent.new_enemy_skill_component(self)
	
	velocity = Vector2(-10.0, 0)

func _physics_process(_delta: float) -> void:
	move_and_slide()
