extends EventPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_voltar_pressed():
	pass # replace with function body
	audio_player.play("click")
	get_tree().change_scene("res://scenes/escolhadojogo.tscn")


func _on_normal_pressed():
	pass # replace with function body
	audio_player.play("click")
	get_tree().change_scene("res://scenes/numero1.tscn")


func _on_dificil_pressed():
	pass # replace with function body
	audio_player.play("click")
	get_tree().change_scene("res://scenes/numero2.tscn")
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior
