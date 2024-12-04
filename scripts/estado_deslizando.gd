class_name Deslizando
extends Estado

var velocidade_deslize:= 1.35

func ao_entrar():
	toca_animação.play("Deslizando")
	ator.velocity.x = ator.velocity.x * velocidade_deslize


func update(delta):
	input_movimentacional()

	ao_cair()

	if ator.velocity.x > 350 or ator.velocity.x < -350:
		if ator.velocity.x < 0 and ator.velocity.x != -350:
			ator.velocity.x = move_toward(ator.velocity.x, -350, 04.25)
		if ator.velocity.x > 0 and ator.velocity.x != 350:
			ator.velocity.x = move_toward(ator.velocity.x, 350, 04.25)

	if ator.velocity.x <= 350 and ator.velocity.x >= -350:
		ator.velocity.x = move_toward(ator.velocity.x, 0, 05.0)
		ao_levantar()
		ao_parar()
		ao_pular()
		ao_andar()

	ator.move_and_slide()

func ao_cair():
	if !ator.is_on_floor():
		maquina.trocar_por_nome("Caindo")

func ao_levantar():
	if ator.velocity.x <= 50 and ator.velocity.x >= -50:
		toca_animação.play("Levantando")

func ao_parar():
	if ator.velocity == Vector2.ZERO:
		maquina.trocar_por_nome("Idle")

func ao_pular():
	if input_direcional_y > 0:
		maquina.trocar_por_nome("Pulando")

func ao_andar():
	if input_direcional_x:
		maquina.trocar_por_nome("Andando")
