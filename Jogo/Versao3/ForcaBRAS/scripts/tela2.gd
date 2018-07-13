extends EventPlayer

func _on_normal_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/fase.tscn")

func _on_dificil_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/fase2.tscn")

func _on_voltar_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/escolhadojogo.tscn")
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior
