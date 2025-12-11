extends CharacterBody2D
class_name Ball

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if not area is Hurtbox:
		return
	var _hurtbox = area as Hurtbox
		
	queue_free()
