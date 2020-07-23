extends Spatial



func _ready():
	get_tree().connect("network_peer_disconnected", self, "peer_disconnected")
	if not Net.is_host:
		get_tree().connect("server_disconnected", self, "server_disconnected")
	Net.set_ids()
	create_players()

func create_players():
	for id in Net.peer_ids:
		create_player(id)
	create_player(Net.net_id)

func create_player(id):
	var p = preload("res://Scenes/Player3D.tscn").instance()
	add_child(p)
	p.initialize(id)

func peer_disconnected(id):
	if id != 0:
		get_node(str(id)).queue_free()
		if Net.is_host:
			pass

func server_disconnected():
	get_tree().change_scene("res://Scenes/Lobby.tscn")
