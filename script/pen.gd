extends State
class_name Pen

@export var ghost : CharacterBody2D
@onready var timer: Timer = $PenTimer

#Transitioned.emit(self,"Target_state")

func enter():
	if ghost.color == "pink":
		timer.start(5)
	
	elif ghost.color == "orange":
		timer.start(10)
	
	else:
		timer.start(15)

func exit():
	timer.stop()
	
func update(delta):
	pass
	
func physics_update(delta):
	pass

func _on_pen_timer_timeout() -> void:
	Transitioned.emit("chase")
