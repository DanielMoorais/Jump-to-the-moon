extends Node2D

onready var platformContainer := $platformContainer
onready var platformInicialPositionY = $platformContainer/platform.position.y
onready var camera:=$camera as Camera2D
onready var player:= $player1 as KinematicBody2D

export (PackedScene) var platformScene

func LevelGenerator(amount):
	for itens in amount:
		platformInicialPositionY -= rand_range(36, 70)
		var platformPositionX = rand_range(20,160)
		var newPlatform = platformScene.instance() as StaticBody2D

		newPlatform.position = Vector2(platformPositionX, platformInicialPositionY)
		platformContainer.call_deferred("add_child",newPlatform)

func _ready() ->void:
	randomize()
	LevelGenerator(20)
	
func _physics_process(delta):
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
		


func _on_platformCleaner_body_entered(body):
	body.queue_free()
	LevelGenerator(1)
