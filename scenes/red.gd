extends CharacterBody2D

@export var marker : Array[Node2D]

func _physics_process(delta: float) -> void:
	move_and_slide()
