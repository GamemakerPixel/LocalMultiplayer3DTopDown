extends Button

signal set_connect_type

func _ready():
	if OS.get_name() == "OSX":
		$IP.text = "IP: " + str(IP.get_local_addresses()[7])# + " or " + str(IP.get_local_addresses()[21]))
	else:
		$IP.text = "IP: " + str(IP.get_local_addresses()[7])
	print(IP.get_local_addresses())

func host():
	Net.initialize_server()
	emit_signal("set_connect_type", true)
