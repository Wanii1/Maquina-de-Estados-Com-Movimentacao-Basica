class_name Andando
extends Estado

var velocidade := 500.0

func ao_entrar():
	toca_animação.play("Andando")

func update(delta):
	input_movimentacional()
	if input_direcional_x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

	if input_direcional_x:
		ator.velocity.x = velocidade * input_direcional_x 
	else:
		ao_parar()
	ao_cair()
	ao_deslizar()
	ao_pular()

	ator.move_and_slide()

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
