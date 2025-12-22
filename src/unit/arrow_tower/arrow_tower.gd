extends Unit
class_name ArrowTower

@onready var bullet_position: Marker2D = $BulletPosition
@onready var spawn_timer: Timer = $SpawnTimer


# 是否启动
var active: bool = false
var enemy_list: Array[Node2D] = []


func _ready() -> void:
	skill_component.skill = preload("res://src/unit/arrow_tower/arrow_tower_skill.tres").duplicate(true)
	skill_component.attribute_set = preload("res://src/unit/arrow_tower/arrow_tower_attribute_set.tres").duplicate(true)
	skill_component.health = Health.new()
	skill_component.mount()
	pass


func release_skill():
	if skill_system == null:
		printerr("Skill system not found.")
		return
		
	if enemy_list.is_empty():
		return
	
	var target = enemy_list[0]
	
	print("Skill start.")
	var unit = UnitSkillComponent.new_unit_skill_component(self)
	var enemy = EnemySkillComponent.new_enemy_skill_component(target)
	var payload = {
		"bullet_position": bullet_position.global_position
	}
	skill_system.execute(skill_component.skill, unit, enemy, payload)


func on_warning(enemy: Node2D):
	enemy_list.push_back(enemy)
	if not active:
		spawn_timer.start()
		active = true
		call_deferred("release_skill")


func _on_spawn_timer_timeout() -> void:
	call_deferred("release_skill")


func _on_attack_distance_body_entered(body: Node2D) -> void:
	on_warning(body)
