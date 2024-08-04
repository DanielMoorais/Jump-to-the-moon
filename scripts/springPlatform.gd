extends "res://scripts/blockPlatform.gd"

func response():
	$animatedSpring.play("default")

func _on_animatedSpring_animation_finished():
	$animatedSpring.frame = 0
	$animatedSpring.stop()
