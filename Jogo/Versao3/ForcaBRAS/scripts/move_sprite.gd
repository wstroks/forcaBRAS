extends Sprite

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	
	get_parent().set_offset(get_parent().get_offset() + (10*delta))
