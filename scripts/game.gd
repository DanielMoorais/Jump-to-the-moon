extends Node2D

onready var platformContainer := $platformContainer
onready var platformInicialPositionY = $platformContainer/blockPlatform.position.y
onready var camera:=$camera as Camera2D
onready var player:= $player1 as KinematicBody2D

export (Array, PackedScene) var platformScene

func LevelGenerator(amount):
	for itens in amount:
		var newPlatform
		var randNumber = randi() % 100
		platformInicialPositionY -= rand_range(60, 100)
		var platformPositionX = rand_range(30,150)
		
		if randNumber < 70:
			newPlatform = platformScene[0].instance() as StaticBody2D
		elif randNumber < 90:
			newPlatform = platformScene[1].instance() as StaticBody2D
			newPlatform.connect("deleteObject",self, "deleteObject")
		elif randNumber < 100:
			newPlatform = platformScene[2].instance() as StaticBody2D
			
		newPlatform.position = Vector2(platformPositionX, platformInicialPositionY)
		platformContainer.call_deferred("add_child",newPlatform)

func _ready() ->void:
	randomize()
	LevelGenerator(15)
	
func _physics_process(delta):
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
	
func deleteObject(obstacle):
	
	obstacle.queue_free()
	LevelGenerator(1)
	
func _on_platformCleaner_body_entered(body):
	if body == player:
		if get_tree().change_scene("res://scenes/title-screen.tscn") != OK:
			print("Error")
	else:
		body.queue_free()
		LevelGenerator(1)

