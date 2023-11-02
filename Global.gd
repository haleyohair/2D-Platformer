extends Node

var coins=0
var time =30

func _ready():
	process_mode=Node.PROCESS_MODE_ALWAYS

	
		
func add_coin():
	coins+=1
	var Coins= get_node_or_null("/root/Game/UI/HUD/Coins")
	if Coins!= null:
		Coins.text="Coins: " +str(coins)
	if coins>19:
		get_tree().change_scene_to_file("res://UI/end_game.tscn")

func update_time(t):
	time+=t

func reset():
	get_tree().paused=false
	coins=0
	time=30
	
func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		var menu=get_node_or_null("/root/Game/UI/Menu")
		if menu==null:
			get_tree().quit()
		else:
			if menu.visible:
				get_tree().paused=false
				menu.hide()
			else:
				get_tree().paused=true
				menu.show()
