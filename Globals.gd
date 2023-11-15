extends Node

signal coins_changed
signal ButterChicken_changed
signal MincePie_changed
signal SteacknCheese_changed


const BGM_IDX = 1
const SFX_IDX = 2


var bgm_enabled setget set_bgm_enabled, is_bgm_enabled
var sfx_enabled setget set_sfx_enabled, is_sfx_enabled

var coins_collected: int = 0
var coins_pending: int = 0 setget _set_coins_panding

var ButterChicken_collected: int = 0
var ButterChicken_panding: int =0 setget _set_ButterChicken_panding

var MincePie_collected: int = 0
var MincePie_panding: int =0 setget _set_MincePie_panding

var SteacknCheese_collected: int = 0
var SteacknCheese_panding: int =0 setget _set_SteacknCheese_panding

var deaths: int = 0


onready var animation_player = $AnimationPlayer


func get_ButterChicken():
	return ButterChicken_collected +ButterChicken_panding
func _set_ButterChicken_panding(value):
	ButterChicken_panding =value
	emit_signal("ButterChicken_changed")
	
	
func get_MincePie():
	return MincePie_collected +MincePie_panding
func _set_MincePie_panding(value):
	MincePie_panding =value
	emit_signal("MincePie_changed")
	
	
func get_SteacknCheese():
	return SteacknCheese_collected + SteacknCheese_panding
func _set_SteacknCheese_panding(value):
	SteacknCheese_panding =value
	emit_signal("SteacknCheese_changed")


func get_coins():
	return coins_collected + coins_pending	
func _set_coins_panding(value):
	coins_pending = value
	emit_signal("coins_changed")


func back_to_menu():
	go_to_world("res://MainMenu.tscn")
	
	
func start_game():
	coins_collected = 0
	coins_pending = 0
	deaths = 0
	ButterChicken_collected = 0
	ButterChicken_panding = 0
	MincePie_collected = 0
	MincePie_panding = 0
	SteacknCheese_collected = 0
	SteacknCheese_panding = 0
	go_to_world("res://src/worlds/World1.tscn")
	
func key_button():
	go_to_world("res://src/KeyScreen.tscn")
	
func complated_game():
	go_to_world("res://src/objects/GameComplate.tscn")
	

func reload_world():
	coins_pending = 0
	deaths += 1
	ButterChicken_panding = 0
	MincePie_panding = 0
	SteacknCheese_panding = 0
	animation_player.play_backwards("fade-in")
	yield(animation_player, "animation_finished")
	get_tree().reload_current_scene()
	animation_player.play("fade-in")


func go_to_world(path):
	coins_collected += coins_pending
	coins_pending = 0
	ButterChicken_collected =0
	ButterChicken_panding = 0  
	MincePie_collected =0
	MincePie_panding = 0
	SteacknCheese_collected = 0
	SteacknCheese_panding = 0 
	
	animation_player.play_backwards("fade-in")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(path)
	animation_player.play("fade-in")


func is_bgm_enabled():
	return not AudioServer.is_bus_mute(BGM_IDX)
func set_bgm_enabled(value):
	AudioServer.set_bus_mute(BGM_IDX, not value)
func is_sfx_enabled():
	return not AudioServer.is_bus_mute(SFX_IDX)
func set_sfx_enabled(value):
	AudioServer.set_bus_mute(SFX_IDX, not value)
	
	
