
extends EventPlayer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_TextureButton_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/ui.tscn")
	pass # replace with function body
