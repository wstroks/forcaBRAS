
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func play(sample_name):
	get_node("sample_player").play(sample_name)
	pass


