class_name Caindo
extends Estado

var gravidade := -15.0
var velocidado_no_ar := 250.0

func ao_entrar():
	toca_animação.play("Caindo")

func update(delta):
	input_movimentacional()
	if !ator.is_on_floor():
		ator.velocity.y -= gravidade
		if input_direcional_x:
			ator.velocity.x = velocidado_no_ar * input_direcional_x
	elif ator.is_on_floor() and input_direcional_x:
		maquina.trocar_de_estado(maquina.Andando)
	elif ator.is_on_floor() and input_direcional_y < 0:
		maquina.trocar_de_estado(maquina.Deslizando)
	else: 
		maquina.trocar_de_estado(maquina.Idle)
	ator.move_and_slide()
