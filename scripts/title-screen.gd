extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var highscore := $main/highscore as Label

func _ready () -> void:
	highscore.text = "Highscore\n" + str(Global.highscore)


func _on_startbtn_pressed():
	if get_tree().change_scene("res://scenes/doodle_jump.tscn") != OK:
		print("Error")
	


func _on_quitbtn_pressed():
	get_tree().quit()
