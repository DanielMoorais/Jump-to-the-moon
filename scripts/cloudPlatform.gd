extends "res://scripts/blockPlatform.gd"

func response():
	emit_signal("deleteObject", self)
