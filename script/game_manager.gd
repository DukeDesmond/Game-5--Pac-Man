extends Node

@onready var ghosts: Node = $Ghosts
@export var player : CharacterBody2D
var screen_size
var power : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = player.get_viewport_rect().size 


func _on_left_exit_body_entered(body: CharacterBody2D) -> void:
	player.global_position.x = screen_size.x


func _on_right_exit_body_entered(body: CharacterBody2D) -> void:
	player.global_position.x = 0

func _on_power_pellet_eaten() -> void:
	for ghost in $Ghosts.get_children():
		ghost.pallet_eaten = true
