class_name Maquina
extends Node

var _estado_atual: Node



func _ready() -> void:
	_estado_atual = get_child(0) as Estado if get_child_count() > 0 else null

func _physics_process(delta: float) -> void:
	_estado_atual.update(delta)

func trocar_por_nome(nome: String):
	trocar_de_estado(get_node_or_null(nome) as Estado)

func trocar_de_estado(estado: Estado):
	_estado_atual = estado
	estado.ao_entrar()
