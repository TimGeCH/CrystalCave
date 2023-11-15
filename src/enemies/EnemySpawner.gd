extends Position2D

export var enemy_secene: PackedScene
export var interval = 2.0

onready var timer = $Timer

func _ready():
	if enemy_secene:
		timer.start(interval)


func _on_Timer_timeout():
	var enemy: Node2D = enemy_secene.instance()
	get_parent().add_child(enemy)
	enemy.global_position = global_position
