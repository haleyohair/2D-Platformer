extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if get_child_count() == 1:
		var Player = load("res://player.tscn")
		var player = Player.instantiate()
		player.position = $Spawn.position
		add_child(player)
