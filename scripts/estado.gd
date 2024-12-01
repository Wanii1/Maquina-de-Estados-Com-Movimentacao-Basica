class_name Estado
extends Node

@export var ator: CharacterBody2D
@export var maquina: Maquina
@export var toca_animação: AnimationPlayer
@export var sprite: Sprite2D

var input_direcional_x
var input_direcional_y
var input_de_pulo:= false
var input_de_delize:= false

func input_movimentacional():
	input_direcional_x = Input.get_axis("Esquerda", "Direita")
	input_direcional_y = Input.get_axis("Deslize", "Pulo")

func update(delta):
	pass
func ao_entrar():
	pass

func ao_sair():
	pass
