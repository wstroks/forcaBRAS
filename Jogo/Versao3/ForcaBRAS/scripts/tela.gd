extends EventPlayer

func _ready():
	pass
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior

func _on_sair_pressed():
	audio_player.play("click")
	get_tree().quit()

func _on_jogar_pressed():
	print("Playing the game!")
	audio_player.play("click")
	get_tree().change_scene("res://scenes/escolhadojogo.tscn")

func _on_sobre_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/sobre.tscn")
