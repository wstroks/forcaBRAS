extends Node

func _ready():
	pass
	
func play(sample_name):
	get_node("sample_player").play(sample_name)
	pass
