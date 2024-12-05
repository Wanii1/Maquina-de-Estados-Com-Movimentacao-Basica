class_name Idle
extends Estado


func ao_entrar():
	toca_animação.play("Idle")

func update(delta):
	input_movimentacional()
	ator.velocity.x = move_toward(ator.velocity.x, 0, 35.0)

	ao_cair()
	ao_andar()
	ao_pular()

	ator.move_and_slide()

func ao_cair():
	if !ator.is_on_floor():
		maquina.trocar_por_nome("Caindo")

func ao_andar():
	if input_direcional_x:
		maquina.trocar_por_nome("Andando")

func ao_pular():
	if input_direcional_y:
		if input_direcional_y > 0:
			maquina.trocar_por_nome("Pulando")
