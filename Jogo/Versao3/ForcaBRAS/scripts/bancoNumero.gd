extends Node

var palavras = [['2', '1 + 1'], ['500','100 * 5']
                
                ]

func _get_palavras():
	return self.palavras

func _ultima_palavra():
	if(self.palavras.size() == 0):
		return true
	else: return false

#chamada sempre para sortear uma palavra e remove-la do jogo atual
func sort_palavras():
	var pos = 0
	var palavra = ''
	if(palavras.size() != 0):
		randomize()
		pos = randi()%palavras.size()
		palavra = palavras[pos]
		palavras.remove(pos)
	return palavra

#TRATAR PALAVRAS COM ACENTO:
func ignorar_acentuacao(var char):
	return char