extends State
class_name Chase

var player : CharacterBody2D
const SPEED = 30
@export var ghost : CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = %NavigationAgent2D
@onready var timer: Timer = $ChaseTimer

#Transitioned.emit(self,"Target_state")

func enter():
	player = get_tree().get_first_node_in_group("Player")
	timer.start(5)

func exit():
	timer.stop()
	
func update(delta):
	#Every Frame while active
	pass
	
func physics_update(delta):
	#Every Physics tick while active
	target()
	var next_pos = navigation_agent_2d.get_next_path_position()
	var direction = ghost.global_position.direction_to(next_pos)
	ghost.velocity = direction * SPEED
	
func target():
	navigation_agent_2d.target_position = player.global_position


func _on_chase_timer_timeout() -> void:
	Transitioned.emit("chase","scatter")
