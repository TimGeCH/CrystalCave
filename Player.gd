extends KinematicBody2D

const gravity = 2000
const max_speed = 300
const jump_force = 800
const acceleration = max_speed / 0.2
const air_acceleration = max_speed / 0.05
const fireball = preload("res://src/Fallball.tscn")

export var is_dead = false

var velocity = Vector2.ZERO
var is_jumping = false

onready var sprite = $player
onready var animation_sprite = $player
onready var coyote_timer = $CoyoteTimer
onready var jump_request_timer = $JumpRequestTimer
onready var jump_sound = $JumpSound
onready var death_sound = $DeathSound

func _physics_process(delta):
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_floor():
		is_jumping = false
	elif was_on_floor and not is_jumping:
		coyote_timer.start()	
		 
func _input(event):
	if is_dead:
		return
	if event.is_action_pressed("ui_up"):
		jump_request_timer.start()
	if event.is_action_released("ui_up") and velocity.y < -jump_force / 2:
		velocity.y = -jump_force / 2
		
		
func _process(delta):
	velocity.y += gravity * delta
	
	if is_dead:
		return
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var acc = air_acceleration if is_jumping else acceleration
	velocity.x = move_toward(velocity.x, direction * max_speed, acc * delta)
	
	
	var can_jump = is_on_floor()or coyote_timer.time_left > 0 
	if can_jump and jump_request_timer.time_left > 0:
		velocity.y = -jump_force 
		is_jumping = true
		jump_request_timer.stop()
		coyote_timer.stop()
		jump_sound.play()
	
	if not is_on_floor():
		if velocity.y < 0:
			animation_sprite.play("jump")
		else:
			animation_sprite.play("fall")
			
	elif velocity.x == 0:
		animation_sprite.play("idle")
		
	else:
		animation_sprite.play("walk")
	
	if direction != 0:
		sprite.flip_h = direction < 0
	fire()

func fire():
	if Input.is_action_just_pressed("fire"):
		animation_sprite.play("fire")
		var direction = 1 if not $player.flip_h else -1
		var f = fireball.instance()
		f.direction = direction
		get_parent().add_child(f)
		f.position.y = position.y
		f.position.x = position.x + 25 * direction



func _on_Hitbox_hit():
	velocity.y = -jump_force / 2
	


func _on_HurtBox_hurt():
	velocity.y = -jump_force
	death_sound.play()
	Globals.reload_world()
