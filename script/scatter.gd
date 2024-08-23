extends State
class_name Scatter

const SPEED = 30
@export var ghost : CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = %NavigationAgent2D
@onready var timer: Timer = $ScatterTimer

#Transitioned.emit(self,"Target_state")

func enter():
	timer.start(5)
	 
func exit():
	timer.stop()

	
func update(delta):
	#Every Frame while active
	pass
	
func physics_update(delta):
	target()
	var next_pos = navigation_agent_2d.get_next_path_position()
	var direction = ghost.global_position.direction_to(next_pos)
	ghost.velocity = direction * SPEED

func target():
	navigation_agent_2d.target_position = ghost.marker[0].global_position



func _on_scatter_timer_timeout() -> void:
		Transitioned.emit("scatter","chase")
