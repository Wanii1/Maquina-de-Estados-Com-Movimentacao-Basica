class_name Andando
extends Estado

var velocidade := 300.0
var velocidade_correr:= 600.0
var correndo = false
var desacelerando = false
func ao_entrar():
	toca_animação.play("Andando")

func update(delta):
	input_movimentacional()



	if Input.is_action_pressed("Correr"):
		correndo = true
		ator.velocity.x = velocidade_correr * input_direcional_x
	elif Input.is_action_just_released("Correr"):
		correr_para_andar()
		correndo = false
	if input_direcional_x and !correndo:
		ator.velocity.x = velocidade * input_direcional_x 

	if !input_direcional_x:
		ao_parar()
	ao_cair()
	ao_deslizar()
	ao_pular()

	ator.move_and_slide()

func correr_para_andar():
	desacelerando = true
	await ator.velocity.x == move_toward(velocidade_correr, velocidade, 1.0)
	return !desacelerando 

func ao_cair():
	if !ator.is_on_floor():
		maquina.trocar_por_nome("Caindo")

func ao_deslizar():
	if input_direcional_y < 0:
		maquina.trocar_por_nome("Deslizando")

func ao_pular():
	if input_direcional_y > 0:
		maquina.trocar_por_nome("Pulando")

func ao_parar():
	maquina.trocar_por_nome("Idle")
