extends Area2D



func _on_End_body_entered(body):
	if Globals.get_MincePie() == 1 and Globals.get_SteacknCheese() == 1 and Globals.get_ButterChicken() == 1:
		Globals.go_to_world("res://src/objects/GameComplate.tscn")
	else:
		Globals.go_to_world("res://src/objects/Fail.tscn")
