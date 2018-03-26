extends EventPlayer

var Obj  

func _ready():
	Obj = load("res://scripts/tela2.gd").new()
	
func _on_body_1_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")
	Obj.set_personagem('Personagem0')

func _on_body_2_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")
	Obj.set_personagem('Personagem1')

func _on_girl_1_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")
	Obj.set_personagem('Personagem2')

func _on_girl_2_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")
	Obj.set_personagem('Personagem3')


func _on_TextureButton_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/ui.tscn")
