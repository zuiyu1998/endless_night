extends CharacterBody2D


func _ready() -> void:
	velocity = Vector2(-10.0, 0)

func _physics_process(_delta: float) -> void:
	move_and_slide()
