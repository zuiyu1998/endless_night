extends CharacterBody2D

@onready var bullet_position: Marker2D = $BulletPosition

var ball_tscn = preload("res://src/bullet/ball/ball.tscn")

# 是否启动
var active: bool = false
var enemy_list: Array[Node2D] = []

func release_skill():
	if enemy_list.is_empty():
		return
	var enemy = enemy_list[0] as Node2D
	
	var direction = (enemy.global_position - bullet_position.global_position).normalized()
	
	var ball = ball_tscn.instantiate() as Ball
	ball.position = bullet_position.global_position
	ball.velocity = direction * 10
	get_tree().current_scene.add_child(ball)

func on_warning(enemy: Node2D):
	enemy_list.push_back(enemy)
	if not active:
		call_deferred("release_skill")

func _on_area_2d_body_entered(body: Node2D) -> void:
	on_warning(body)
