extends Control

func _ready():
	_hook_button_sound(self)
	_update_buttons()

onready var click_sound = $ClickSound
onready var transtions = $UI/Menu/Transtions
onready var sfx_button = $UI/Menu/OptionsMenu/SFXButton
onready var bgm_button = $UI/Menu/OptionsMenu/BGMButton

func _hook_button_sound(node):
	for child in node.get_children():
		if child is Button:
			child.connect("pressed", click_sound, "play")
		else:
			_hook_button_sound(child)


func _on_BackButton_pressed():
	transtions.play_backwards("show-options")


func _on_OptionButton_pressed():
	transtions.play("show-options")


func _on_SFXButton_pressed():
	Globals.sfx_enabled = not Globals.sfx_enabled
	_update_buttons()


func _on_QuitButton_pressed():
	get_tree().quit()





func _on_BGMButton_pressed():
	Globals.bgm_enabled = not Globals.bgm_enabled
	_update_buttons()
	
func _update_buttons():
	bgm_button.text = "BGM:" + ("On" if Globals.bgm_enabled else "Off")
	sfx_button.text = "SFX:" + ("On" if Globals.sfx_enabled else "Off")


func _on_StartButton_pressed():
	Globals.start_game()


func _on_Key_pressed():
	Globals.key_button()
