extends Node

var palavras = [['2', 'Operação de soma: 1 + 1 é'], ['500','Operação de multiplicação: 100 * 5 é'],
                
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