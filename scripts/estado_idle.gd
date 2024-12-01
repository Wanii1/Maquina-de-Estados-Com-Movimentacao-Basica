class_name Idle
extends Estado


func ao_entrar():
	toca_animação.play("Idle")

func update(delta):
	input_movimentacional()
	ator.velocity.x = move_toward(ator.velocity.x, 0, 9.0)
	if !ator.is_on_floor():
		maquina.trocar_de_estado(maquina.Caindo)
	if input_direcional_x:
		ao_andar()
	if input_direcional_y:
		if input_direcional_y > 0:
			maquina.trocar_de_estado(maquina.Pulando)
	ator.move_and_slide()

func ao_andar():
	maquina.trocar_de_estado(maquina.Andando)
