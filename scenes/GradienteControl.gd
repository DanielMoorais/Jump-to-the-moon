extends Control

var score = 0
onready var camera = $".."
onready var camera_start_position = camera.position.y
onready var background_azul = $Background_azul
export var input_start = 100
export var input_end = 300
export var output_start = 1
export var output_end = 0


func _process(delta: float)-> void: 
	score = camera_start_position - camera.position.y
	
	var result = 1 if score < input_start else (score - input_start) / (input_end - input_start) * (output_end - output_start) + output_start
	background_azul.modulate.a = result

	if score > 4500 and not $Star_particle.visible :
		$Star_particle.visible = true
	
