extends Node

var palavras = [['amarelo', 'cor'], ['manga','fruta'],
                ['baleia', 'mamífero marinho'], ['primavera', 'estação do ano'],
                ['feijão', 'comida'], ['suco', 'bebida saudável'],
                ['cachorro','melhor amigo do homem'], ['gato','animal de estimação'],
                ['água','bebida'], ['camisa','roupa'],
                ['bahia','estado do brasil'], ['mosquito','inseto que voa'],
                ['janeiro','mês do ano'], ['forno', 'aparelho para assar alimentos'],
                ['porta','abertura em uma parede'], ['carro', 'transporte pessoal'],
                ['violão','instrumento musical'], ['sorvete', 'doce gelado'],
                ['carro','transporte'], ['braço', 'faz parte do seu corpo'],
                ['cadeira','lugar onde se pode sentar'], ['televisão', 'meio de comunicação'],
                ['cama','lugar onde se pode deitar'], ['escova', 'higiene bucal'],
                ['navio', 'transporte aquático'],['ventilador', 'espanta o calor'], 
                ['futebol', 'esporte'],['cavalo', 'animal'],
                ['caderno', 'material escolar'],['lápis', 'material escolar'],
                ['goiaba', 'fruta'],['brasília', 'capital do brasil'],
                ['barco', 'transporte aquático'], ['notebook', 'computador portátil'],['japão', 'país'],
                ['Amazonas', 'maior rio do brasil é'],['perna', 'faz parte do seu corpo'],
                ['mão', 'faz parte do seu corpo'],['forró', 'gênero musical'],['rock', 'gênero musical'],['ônibus', 'transporte coletivo'],
                ['médico', 'Profissional da Saúde'],['enfermeiro', 'Profissional da Saúde'],['professor', 'Profissional da Educação'],
                ['roupa', 'vestuário'],['vôlei', 'esporte'],['terror', 'gênero de filme'],['comédia', 'gênero de filme'],['ação', 'gênero de filme'], ['geladeira', 'eletrônico doméstico'],['liquidificador', 'eletrônico doméstico'],['bola', 'futebol'],
                ['soma', 'operação básica da matemática'],['subtração', 'operação básica da matemática'],['multiplicação', 'operação básica da matemática'],['divisão', 'operação básica da matemática'],
                ['relógio', 'equipamento que marca as horas'],['bicicleta', 'transporte de duas rodas'],['motocicleta', 'transporte de duas rodas'], ['câmera', 'máquina de tirar fotos'],['celular', 'meio de comunicação'],['biblioteca', 'lugar de ler livros'],
                ['xícara', 'utensílio para beber chá ou café'],
                ['recreio', 'intervalo escolar'],
                ['vaso', 'objeto usado para decoração que serve para armazenar flores'],
                ['caneta', 'objeto usado para escrever'],
                ['avião', 'transporte aéreo'],
                ['bota', 'calçado dos pés'],
                ['sopa', 'alimento com caldo e verduras'],
                ['colher', 'objeto que leva comida para a boca'],
                ['prato', 'peça de louça'],
                ['elefante', 'animal com tromba'],
                ['escola', 'lugar onde se aprende'],
                ['felicidade', 'sentimento de alegria'],
                ['criança', 'ser humano na fase da infância'],
                ['lua', 'satélite da terra'],
                ['leão', 'rei da selva'],
                ['parque', 'jardim público de diversão com muitos brinquedos'],
                ['urso', 'animal forte e peludo'],
                ['tartaruga', 'animal que possui um casco como casa'],
                ['jacaré', 'animal parecido com crocodilo'],
                ['trabalho', 'conjunto de atividades ou tarefa a cumprir'],
                ['coração', 'órgão que bombeia o sangue'],
                ['cidade', 'lugar onde habita cidadãos'],
                ['chuva', 'água que cai do céu'],
                ['frio', 'contrário de calor'],
                ['relâmpago', 'clarão elétrico na tempestade'],
                ['nuvem', 'partículas de água em forma de vapor'],
                ['calor', 'condição do que é quente'],
                ['sol', 'centro do sistema solar'],
                ['cobertor', 'usado para nos manter aquecidos enquanto dormimos'],
                ['amizade', 'sentimento de grande afeição e simpatia entre pessoas'],
                ['feio', 'contrário de bonito'],
                ['morcego', 'mamífero voador'],
                ['tio', 'irmão da mãe'],
                ['salvador', 'primeira capital do brasil'],
                ['domingo', 'primeiro dia da semana'],
                ['natação', 'esporte praticado na água'],
                ['português', 'língua oficial do brasil'],
                ['lençol', 'forra o colchão'],
                ['laranja', 'fruta cítrica'],
                ['zebra', 'animal com listras'],
                ['veterinário', 'médico dos animais'],
                ['cobra', 'animal rastejante'],
                ['vaca', 'animal que dá leite'],
                ['égua', 'feminino de cavalo'],
                ['flauta', 'instrumento de sopro'],
                ['abelha', 'animal que produz mel'],
                ['constelação', 'coletivo de estrelas'],
                ['flash', 'luz da câmera fotográfica'],
                ['dentista', 'profissional que cuida da saúde bucal'],
                ['homem', 'masculino de mulher'],
                ['ilha', 'porção de terra rodeada por água'],
                ['faca', 'corta os alimentos'],
                ['farmácia', 'local onde se compra remédios'],
                ['oca', 'moradia de índios'],
                ['piano', 'instrumento musical com teclas'],
                ['jornal', 'programa de tv que informa as notícias'],
                ['baiano', 'adjetivo pátrio da bahia'],
                ['verde', 'uma das cores da bandeira do brasil'],
                ['mochila', 'bolsa escolar'],
                ['madeira', 'matéria prima do papel'],
                ['cozinha', 'local de preparo dos alimentos'],
                ['tesoura', 'serve para cortar'],
                ['borracha', 'apaga erros do lápis'],
                ['óculos', 'melhora a visão'],
                ['maçã', 'fruto da macieira'],
                ['fêmur', 'maior osso do corpo'],
                ['saturno', 'planeta do sistema solar'],
                ['sábado', 'dia da semana'],
                ['anel', 'usamos no dedo'],
                ['esmalte', 'serve para pintar unhas'],
                ['galinha', 'animal que cacareja'],
                ['macaco', 'animal que come banana'],
                ['bolo', 'alimento comum de festas'],
                ['pétala', 'parte da flor'],
                ['pomba', 'símbolo da paz'],
                ['careca', 'quem não tem cabelo'],
                ['espada', 'arma cortante'],
                ['quarto', 'cômodo onde dormimos'],
                ['gelo', 'água em estado sólido'],
                ['rato', 'inimigo do rato'],
                ['espelho', 'reflete o que vê']
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
	if(char == 'Â' or char == 'Ã' or char == 'Á' or char == 'À'):
		return 'A'
	elif(char == 'Ô' or char == 'Õ' or char == 'Ó' or char == 'Ò'):
		return 'O'
	elif(char == 'Î' or char == 'Í' or char == 'Ì'):
		return 'I'
	elif(char == 'Ê' or char == 'É' or char == 'È'):
		return 'E'
	elif(char == 'Û' or char == 'Ú' or char == 'Ù'):
		return 'U'
	elif(char == 'Ç'):
		return 'C'
	else: return char