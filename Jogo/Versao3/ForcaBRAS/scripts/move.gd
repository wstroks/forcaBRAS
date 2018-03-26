extends AnimatedSprite

var delay

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(get_parent().get_children()[0].get_animation()=='pato'):
		delay = 1
	elif(get_parent().get_children()[0].get_animation()=='abelha'):
		delay = 10
	else: delay = 20
	
	get_parent().set_offset(get_parent().get_offset() + (delay*delta))