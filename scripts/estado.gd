class_name Estado
extends Node

@export var ator: CharacterBody2D
@export var toca_animação: AnimationPlayer
@export var sprite: Sprite2D
@onready var maquina : Maquina = get_parent()

var input_direcional_x
var ultimo_input: float
var input_direcional_y
var input_de_pulo:= false
var input_de_delize:= false



func input_movimentacional():
	input_direcional_x = Input.get_axis("Esquerda", "Direita")
	input_direcional_y = Input.get_axis("Deslize", "Pulo")
	if input_direcional_x: mudar_sprite_h()
	print (ultimo_input, " ", input_direcional_x)

func mudar_sprite_h():
	if input_direcional_x < 0:
		ultimo_input = input_direcional_x
		sprite.flip_h = true
		
	elif input_direcional_x > 0:
		ultimo_input = input_direcional_x
		sprite.flip_h = false
	else:
		if ultimo_input < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false

func update(delta):
	pass
func ao_entrar():
	pass

func ao_sair():
	pass
