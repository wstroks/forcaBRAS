extends EventPlayer

func _on_normal_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/fase.tscn")

func _on_dificil_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/fase2.tscn")

func _on_voltar_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/ui.tscn")
