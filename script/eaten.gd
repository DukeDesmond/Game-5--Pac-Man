extends State
class_name Eaten

const SPEED = 60
@export var ghost : CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = %NavigationAgent2D

#Transitioned.emit(self,"Target_state")

func enter():
	ghost.collision_shape_2d.disabled=true
	
func exit():
	ghost.collision_shape_2d.disabled=false

func update(delta):
	pass
	
func physics_update(delta):
	target()
	var next_pos = navigation_agent_2d.get_next_path_position()
	var direction = ghost.global_position.direction_to(next_pos)
	ghost.velocity = direction * SPEED

func target():
		navigation_agent_2d.target_position = ghost.marker[1].global_position
	
func _on_navigation_agent_2d_navigation_finished() -> void:
	ghost.eaten = false
	ghost.pallet_eaten = false
	Transitioned.emit("chase")
