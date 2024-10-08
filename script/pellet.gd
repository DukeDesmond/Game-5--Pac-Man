extends Sprite2D


@onready var area_2d: Area2D = $Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		audio_stream_player_2d.play()
	


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
