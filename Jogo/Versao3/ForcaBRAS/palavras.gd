extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var palavras

func _ready():
	palavras = []

func inicializa_palavras():
    self.palavras = [['abraco', 'demonstração de afeto'], 
                     ['teste', 'apenas um teste']]

func _get_palavras():
	return self.palavras