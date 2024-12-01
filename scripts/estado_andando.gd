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

	if !ator.is_on_floor():
		maquina.trocar_de_estado(maquina.Caindo)
	if input_direcional_y:
		if input_direcional_y < 0:
			maquina.trocar_de_estado(maquina.Deslizando)
		else:
			maquina.trocar_de_estado(maquina.Pulando)
	if input_direcional_x:
		ator.velocity.x = velocidade * input_direcional_x 
	else:
		maquina.trocar_de_estado(maquina.Idle)
	ator.move_and_slide()
