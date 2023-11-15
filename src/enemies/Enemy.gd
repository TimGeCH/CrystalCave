extends KinematicBody2D

const gravity = 2000

export var max_speed = 300
export var acceleration = 50 / 0.2
export var is_dead = false

var velocity := Vector2.ZERO

onready var sprite:Sprite = $Sprite
onready var aninmation_player = $AnimationPlayer


func _on_HurtBox_hurt():
	if aninmation_player.has_animation("death"):
		aninmation_player.play("death")
	else:
		queue_free()
