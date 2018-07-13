extends Control
#FODA-SE:
var buttons         = ['0','1','2','3','4','5','6','7','8','9']

var file            #arquivo txt
var personagem
var node_personagem
var p_direita
var p_esquerda
var b_direito
var b_esquerdo
var camisa
var bermuda
var cabeca_1
var cabeca_2
var cabeca_3
var cabeca_4
var cabeca_5
var array_corpo
var array_cabeca
var char_anterior   #variável auxiliar para manutenção do txt
var palavra         #palavra da fase
var palavra_atual 
var dica            #dica da palavra
var array_palavra = []
var condicao      = true
var tentativas    = 0 #serão sete tentativas
var acertos       = 0 #quantidade de acertos
var palavras      = []
var acertos_fim   = 0 #quantas palavras acertou no fim do jogo
var erros_fim     = 0 #quantas palavras errou no fim do jogo

var _Palavras     = load("res://scripts/bancoNumero.gd");
var Obj           = _Palavras.new()

func _ready():
	pass
####################################################################

####################################################################
#Mudar a imagem do botão
#var button = nome do botão (string)
#var char   = letra do alfabeto (char)
#var path   = nome da pasta [certas ou erradas] (string)
func _set_Image_Button(button, char, path):
	if(!(palavra.length() == self.acertos) and path == 'certas'):
		get_parent().get_node('Control/sprite'+char.to_upper()).set_frame(1)
	elif(path == 'erradas'):
		get_parent().get_node('Control/sprite'+char.to_upper()).set_frame(2)
		_remove_corpo_personagem(char) 
	elif(palavra.length() == self.acertos and path == 'certas'):
		#print("DEBUG 1.0")
		_ocultar_corpo_personagem(char)

#faz alguma coisa que e ao mesmo tempo um monte de coisa...
#var letra = letra para o label
#var bnt   = botão que foi precionado
func _teclado(letra, bnt):
	_processa_letras(letra)
	get_node(bnt).set_disabled (true)

####################################################################
#LÓGICA DO JOGO: Demo
func _get_nova_palavra():
	var palavra   = Obj.sort_palavras()
	self.char_anterior = ''
	if(!palavra == ''):
		self.palavra  = palavra[0]
		self.dica     = palavra[1]
		palavra_atual = '' #null
	else:
		fim_jogo()

func _processa_letras(var char):
	var path = 'erradas'
	#converte a palavra em array de caracteres
	if(condicao):
		for x in palavra:
			array_palavra.append(x)
		condicao = false
	
	for i in range(0,palavra.length()):
		
		if(char == Obj.ignorar_acentuacao(array_palavra[i].to_upper()).to_lower()):
			_revela_letras(array_palavra[i], i)
			path = 'certas'
			#print("char anterior = ",char_anterior,", char = ",char)
			if(char != char_anterior):
				acertos += 1
				#print("DEBUG 2.0 acertos = ", acertos)
	_set_Image_Button('bnt'+char.to_upper(), char, path)
	_set_label_UI()
	char_anterior = char
	return char

func _revela_letras(var char, var i):
	#variáveis auxiliares
	var tca  = [] 
	var palavra_aux = ''
	
	#transforma em array
	for j in palavra_atual:
		tca.append(j)
	
	if(tca[i] == '_'):
		tca.remove(i) #remove primeiro para depois add
		tca.insert(i, char)
	
	for j in range(0, tca.size()):
		if(j==i):
			tca[j] = char
		palavra_aux += tca[j]
	self.palavra_atual = palavra_aux

func _inicializa_palavra():
	if(self.condicao):
		for i in range(0, palavra.length()):
			self.palavra_atual += '_' #traceja a palavra ocultando-a
		self.array_palavra = [] #inicializa array
	_set_label_UI()
###################################################################

###################################################################
#LÓGICA INTERFACE: Demo

func _set_label_UI():
	var panel = get_node("Panel")
	var label = panel.get_node("palavra")
	
	label.set_text(self.palavra_atual)
	
	var dica_label = get_node("Panel1/dica")
	dica_label.set_text(self.dica)

func set_personagem(var personagem):
	Obj           = load("res://scripts/tela2.gd").new()
	self.personagem = Obj.get()

func _inicializa_nodes_personagem():
	array_corpo  = []
	array_cabeca = []
	get_parent().get_node("ParallaxBackground/nuvem").show()
	get_parent().get_node("ParallaxBackground/Node2D/cachorro").show()
	get_parent().get_node("ParallaxBackground/Node2D/gato").show()
	get_parent().get_node("ParallaxBackground/Node2D/guaxi").show()
	get_parent().get_node("ParallaxBackground/Node2D/passaro").show()
	get_parent().get_node("ParallaxBackground/Node2D/Path2D/PathFollow2D/borboleta_1").show()
	get_parent().get_node("ParallaxBackground/Node2D/Path2D 2/PathFollow2D").show()
	get_parent().get_node("ParallaxBackground/Node2D/Path2D 2/PathFollow2D/borboleta_2").show()
	get_parent().get_node("ParallaxBackground/Node2D/Path2D 3").show()
	get_parent().get_node("ParallaxBackground/Node2D/nuvem_3/PathFollow2D").show()
	get_parent().get_node("ParallaxBackground/Node2D/nuvem_3/PathFollow2D/nuvem2").show()
	
	node_personagem = get_parent().get_node(self.personagem)
	p_esquerda = node_personagem.get_node("corpo/p_esquerda")
	p_direita  = node_personagem.get_node("corpo/p_direita")
	b_direito  = node_personagem.get_node("corpo/b_direito")
	b_esquerdo = node_personagem.get_node("corpo/b_esquerdo")
	camisa     = node_personagem.get_node("corpo/camisa")
	bermuda    = node_personagem.get_node("corpo/bermuda")
	
	cabeca_1   = node_personagem.get_node("cabecas/cabeca_1")
	cabeca_2   = node_personagem.get_node("cabecas/cabeca_2")
	cabeca_3   = node_personagem.get_node("cabecas/cabeca_3")
	cabeca_4   = node_personagem.get_node("cabecas/cabeca_4")
	cabeca_5   = node_personagem.get_node("cabecas/cabeca_5")
	
	array_corpo = [
		b_direito, b_esquerdo, p_esquerda, p_direita,
		bermuda, camisa, cabeca_5
	]
	
	array_cabeca = [
		cabeca_1, cabeca_2, cabeca_3, cabeca_4, cabeca_5
	]
	
	node_personagem.show()

func _ocultar_corpo_personagem(var char):
	
	for i in range(0, array_corpo.size()-1):
		array_corpo[i].hide()
	
	for j in range(0, array_cabeca.size()):
		array_cabeca[j].hide()
	_tela_ganhou()
	char_anterior = char

func show_personagem():
	array_cabeca[0].show()
	for i in range(0, array_corpo.size()-1):
		array_corpo[i].show()

func _remove_corpo_personagem(var char):
	if(char == char_anterior):
		pass
	else:
		if(tentativas>5):
			array_cabeca[4].hide()
			_tela_perdeu()
		else:
			if(tentativas==0):
				array_cabeca[0].hide()
				array_cabeca[1].show()
			elif(tentativas==2):
				array_cabeca[1].hide()
				array_cabeca[2].show()
			elif(tentativas==4):
				array_cabeca[2].hide()
				array_cabeca[3].show()
			elif(tentativas==5):
				array_cabeca[3].hide()
				array_cabeca[4].show()
			
			array_corpo[tentativas].hide()
		self.tentativas += 1 #decrementa a quantidade de tentativas
		char_anterior = char

func atualiza_pontuacao():
	get_parent().get_node("Control/erros").set_text("Erros: "+str(self.erros_fim))
	get_parent().get_node("Control/acertos").set_text("Acertos: "+str(self.acertos_fim))
	

func _tela_perdeu():
	self.erros_fim += 1
	audio_player.play("derrota")
	get_parent().get_node("ParallaxBackground/perdeu").show()
	self.palavra_atual = self.palavra
	
	atualiza_pontuacao()
	_fim_fase()

func _tela_ganhou():
	self.acertos_fim += 1
	audio_player.play("venceu")
	get_parent().get_node("ParallaxBackground/parabens").show()
	atualiza_pontuacao()
	_fim_fase()

####################################################################
func _fim_fase():
	if(!self.Obj._ultima_palavra()):
		get_parent().get_node("play").show()
		#get_parent().get_node("voltar").show()
		
	else: 
		get_parent().get_node("resultado").show()

	_habilita_teclado(true)
	

func fim_jogo():
	self.check = 1
	get_parent().get_node("resultado").hide()

####################################################################
#Funções dos botões:
func _on_bnt0_pressed():
	audio_player.play("teclado")
	_teclado('0', 'bnt0')

func _on_bnt1_pressed():
	audio_player.play("teclado")
	_teclado('1', 'bnt1')

func _on_bnt2_pressed():
	audio_player.play("teclado")
	_teclado('2', 'bnt2')

func _on_bnt3_pressed():
	audio_player.play("teclado")
	_teclado('3', 'bnt3')

func _on_bnt4_pressed():
	audio_player.play("teclado")
	_teclado('4', 'bnt4')

func _on_bnt5_pressed():
	audio_player.play("teclado")
	_teclado('5', 'bnt5')

func _on_bnt6_pressed():
	audio_player.play("teclado")
	_teclado('6', 'bnt6')

func _on_bnt7_pressed():
	audio_player.play("teclado")
	_teclado('7', 'bnt7')

func _on_bnt8_pressed():
	audio_player.play("teclado")
	_teclado('8', 'bnt8')

func _on_bnt9_pressed():
	audio_player.play("teclado")
	_teclado('9', 'bnt9')

func _habilita_teclado(var cond):
	for i in range(0, buttons.size()):
		get_node('bnt'+buttons[i]).set_disabled (cond)
		get_parent().get_node('Control/sprite'+buttons[i]).set_frame(0)

func _on_play_pressed():
	#reinicializa a fase
	#QUE GAMBIARRA DA PORRA!!!
	audio_player.play("click")
	
	get_parent().get_node("ParallaxBackground/perdeu").hide()
	get_parent().get_node("ParallaxBackground/parabens").hide()
	get_parent().get_node("play").hide()
	#get_parent().get_node("voltar").hide()
	_get_nova_palavra()
	#print(self.palavra+'-'+self.dica)
	self.condicao = true
	_inicializa_palavra()
	_inicializa_nodes_personagem()
	show_personagem()
	_habilita_teclado(false)
	self.tentativas    = 0 #serão sete tentativas
	self.acertos       = 0 #quantidade de acertos

func _on_ok_pressed():
	audio_player.play("click")
	read_file()

var check = 0 #checa se o botão voltar foi pressionado pela segunda vez

func _on_voltar_pressed():
	audio_player.play("click")
	#get_tree().change_scene("res://scenes/ui.tscn")
	if(check==0):
		fim_jogo()
	else: get_tree().change_scene("res://scenes/ui.tscn")

func _on_body_1_pressed():
	audio_player.play("click")
	iniciar('Personagem0')

func _on_body_2_pressed():
	audio_player.play("click")
	iniciar('Personagem1')

func _on_girl_1_pressed():
	audio_player.play("click")
	iniciar('Personagem2')

func _on_girl_2_pressed():
	audio_player.play("click")
	iniciar('Personagem3')

func _on_voltar_tela2_pressed():
	audio_player.play("click")
	get_tree().change_scene("res://scenes/tela2.tscn")

func iniciar(var personagem):
	self.personagem = personagem
	get_parent().show()
	get_parent().get_node('Control').show()
	
	get_parent().get_node("ParallaxBackground/body_1").hide()
	get_parent().get_node("ParallaxBackground/body_2").hide()
	get_parent().get_node("ParallaxBackground/girl_1").hide()
	get_parent().get_node("ParallaxBackground/girl_2").hide()
	get_parent().get_node("ParallaxBackground/voltar_tela2").hide()
	get_parent().get_node("ParallaxBackground/TextureFrame").hide()
	get_parent().get_node("voltar").show()
	
	file = File.new()
	
	_get_nova_palavra()
	
	_inicializa_palavra()
	_inicializa_nodes_personagem()

func _on_resultado_pressed():
	audio_player.play("click")
	fim_jogo()
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior
