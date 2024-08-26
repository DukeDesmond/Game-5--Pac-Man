extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var marker : Array[Node2D]
var pallet_eaten : bool = false
var eaten : bool = false
var color: String
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	color = self.name.to_lower()
	
func _process(delta: float) -> void:
	if pallet_eaten == false:
		if velocity.x < 0:
			animated_sprite_2d.play("left")
		elif velocity.x > 0:
			animated_sprite_2d.play("right")
	else:
		if eaten == false:
			animated_sprite_2d.play("vulnerable")
		else:
			if velocity.x < 0:
				animated_sprite_2d.play("ghost_eyes_left")
			elif velocity.x > 0:
				animated_sprite_2d.play("ghost_eyes_right")

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player") and (pallet_eaten == true):
		eaten = true
	elif body.is_in_group("Player"):
		print("body entered")
		body.death()
