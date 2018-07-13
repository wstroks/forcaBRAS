extends Control
#export (NodePath) var SamplePlayerPath
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#onready var samplePlayer
var rotation_speed = 2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#play("res://sons/light.smp")
	set_process(true)

func _process(delta):
	var size = get_viewport().get_rect().size
	set_size(size)

func _on_play_button_pressed():
	print("Playing the game!")
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")


func _on_credits_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/sobre.tscn")
	pass # replace with function body


func _on_Sair_pressed():
	audio_player.play("click")
	get_tree().quit()
	
	pass # replace with function body
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior
