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

	ao_andar()
	ao_deslizar()
	ao_parar()

	ator.move_and_slide()

func ao_andar():
	if ator.is_on_floor() and input_direcional_x:
		maquina.trocar_por_nome("Andando")

func ao_deslizar():
	if ator.is_on_floor() and input_direcional_y < 0:
		maquina.trocar_por_nome("Deslizando")

func ao_parar():
	if ator.is_on_floor() and !input_direcional_y:
		maquina.trocar_por_nome("Idle")
