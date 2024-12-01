class_name Maquina
extends Node

@export var _estado_atual: Node
@export var Idle: Estado
@export var Andando: Estado
@export var Pulando: Estado
@export var Caindo: Estado
@export var Deslizando: Estado


func _ready() -> void:
	_estado_atual = Idle

func _physics_process(delta: float) -> void:
	_estado_atual.update(delta)

func trocar_de_estado(estado: Estado):
	_estado_atual = estado
	estado.ao_entrar()
