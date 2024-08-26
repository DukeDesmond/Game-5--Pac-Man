extends State
class_name Chase

var player : CharacterBody2D
const SPEED : int = 30
@export var ghost : CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = %NavigationAgent2D
@onready var timer: Timer = $ChaseTimer
const tile_size : int = 8

#Transitioned.emit(self,"Target_state")

func enter():
	player = get_tree().get_first_node_in_group("Player")
	timer.start(20)

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
	var distance = ghost.position.distance_to(player.position)
	if ghost.color == "pink":
		navigation_agent_2d.target_position = player.global_position + (player.velocity.normalized() * 4 * tile_size)
		if distance < 4 * tile_size:
			navigation_agent_2d.target_position = player.global_position
	
	elif ghost.color == "orange":
		navigation_agent_2d.target_position = player.global_position - (player.velocity.normalized() * 10 * tile_size)
		if distance < 10 * tile_size:
			navigation_agent_2d.target_position = player.global_position
			
	elif ghost.color == "blue":
		navigation_agent_2d.target_position = player.global_position - (player.velocity.normalized() * 8 * tile_size)
		if (distance < 8 * tile_size) and (distance > 2 * tile_size):
			navigation_agent_2d.target_position = ghost.marker[1].global_position
	else:
		navigation_agent_2d.target_position = player.global_position


func _on_chase_timer_timeout() -> void:
	Transitioned.emit("scatter")
