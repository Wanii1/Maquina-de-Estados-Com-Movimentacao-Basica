class_name Pulando
extends Estado

var forca_de_pulo := -550.0

func ao_entrar():
	toca_animação.play("Pulando")

func update(delta):
	input_movimentacional()
	ator.velocity.y = forca_de_pulo
	if !ator.is_on_floor():
		maquina.trocar_de_estado(maquina.Caindo)
	elif ator.is_on_floor() and input_direcional_x:
		maquina.trocar_de_estado(maquina.Andando)
	ator.move_and_slide()
