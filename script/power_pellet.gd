extends Area2D

signal eaten


	
func _on_body_entered(body: Node2D) -> void:
	eaten.emit()
	queue_free()
	
