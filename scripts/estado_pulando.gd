class_name Pulando
extends Estado

var forca_de_pulo := -550.0

func ao_entrar():
	toca_animação.play("Pulando")
	ator.velocity.y = forca_de_pulo

func update(delta):
	input_movimentacional()
	ator.velocity.y = move_toward(ator.velocity.y, 0, 9.0)
	ao_cair()
	ao_andar()

	ator.move_and_slide()

func ao_cair():
	if !ator.is_on_floor() and ator.velocity.y >= 0:
		maquina.trocar_por_nome("Caindo")

func ao_pisar_no_chão():
	if ator.is_on_floor():
		maquina.trocar_por_nome("Idle")

func ao_andar():
	if ator.is_on_floor() and input_direcional_x:
		maquina.trocar_por_nome("Andando")
