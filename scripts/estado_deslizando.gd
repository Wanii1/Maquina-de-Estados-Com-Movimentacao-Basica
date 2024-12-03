class_name Deslizando
extends Estado

var velocidade_deslize:= 1.75

func ao_entrar():
	toca_animação.play("Deslizando")
	ator.velocity.x = ator.velocity.x * velocidade_deslize


func update(delta):
	input_movimentacional()

	if !ator.is_on_floor():
		maquina.trocar_por_nome("Caindo")

	if ator.velocity.x > 350 or ator.velocity.x < -350:
		if ator.velocity.x < 0 and ator.velocity.x != -350:
			ator.velocity.x = move_toward(ator.velocity.x, -350, 02.5)
		if ator.velocity.x > 0 and ator.velocity.x != 350:
			ator.velocity.x = move_toward(ator.velocity.x, 350, 02.5)

	if ator.velocity.x <= 350 and ator.velocity.x >= -350:
		ator.velocity.x = move_toward(ator.velocity.x, 0, 05.0)

		if ator.velocity.x <= 50 and ator.velocity.x >= -50:
			toca_animação.play("Levantando")

		if ator.velocity.x == 0:
			maquina.trocar_por_nome("Idle")

		if input_direcional_y > 0:
			maquina.trocar_por_nome("Pulando")

		if input_direcional_x:
			maquina.trocar_por_nome("Andando")

	ator.move_and_slide()
