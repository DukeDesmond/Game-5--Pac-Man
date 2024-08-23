extends Node

var current_state : State
var states : Dictionary = {}
@export var initial_state : State
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	for child in get_children():
		states[child.name.to_lower()] = child
		child.Transitioned.connect(on_child_transition)
	print(states)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

	elif initial_state:
		
		initial_state.enter()
		current_state = initial_state
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state_name, new_state_name):
	#state_name : Where you Transitioned From
	#new_state_name : Where you WANT to Transition too
	


	var  new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state
