extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var dead : bool = false


const SPEED = 60.0
var movement_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:

	#get_input()
	movement_direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		animated_sprite_2d.play("moving")
		movement_direction = Vector2.RIGHT
		rotation_degrees = 0
		
	elif Input.is_action_pressed("ui_left"):
		animated_sprite_2d.play("moving")
		movement_direction = Vector2.LEFT
		rotation_degrees = 180
	
	elif Input.is_action_pressed("ui_down"):
		animated_sprite_2d.play("moving")
		movement_direction = Vector2.DOWN
		rotation_degrees = 90
	
	elif Input.is_action_pressed("ui_up"):
		animated_sprite_2d.play("moving")
		movement_direction = Vector2.UP
		rotation_degrees = 270
		
	if velocity == Vector2.ZERO and dead == false:
		animated_sprite_2d.play("default")
		
	velocity = movement_direction * SPEED
	
	move_and_slide()
	
func death():
	dead = true
	animated_sprite_2d.play("death")
