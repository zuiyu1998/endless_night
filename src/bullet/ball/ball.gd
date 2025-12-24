extends CharacterBody2D
class_name Ball

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if not area is Hurtbox:
		return
	var hurtbox = area as Hurtbox
	
	if hurtbox.source == null:
		printerr("hurtbox not found source.")
		return
	var skill_component: ISkillComponent = hurtbox.source
	
	skill_component.execute_command(DamageSkillCommand.new_damage_skill_command(3))
	
	queue_free()
