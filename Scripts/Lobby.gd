extends Control



func _ready():
	get_tree().connect("connected_to_server", self, "connected")

func connected():
	if Net.is_host and Net.current_players == Net.MAX_PLAYERS:
		print(Net.current_players)
		rpc("begin_game")
		begin_game()
	else:
		if not Net.is_host:
			rpc_id(0, "player_joined")

remote func begin_game():
	get_tree().change_scene("res://Scenes/Game3D.tscn")

remote func player_joined():
	print("PLAYER CONNECTED")
	Net.current_players += 1
	connected()
