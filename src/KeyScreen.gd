extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Globals.back_to_menu()
