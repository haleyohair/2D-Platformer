extends Node

var coins=0


func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
		
func add_coin():
	coins+=1
	var Coins= get_node_or_null("/root/Game/UI/HUD/Coins")
	if Coins!= null:
		Coins.text="Coins: " +str(coins)

