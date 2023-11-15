extends Area2D



func _on_SteacknCheese_body_entered(body):
	$AnimationPlayer.play("PiePicked")
	Globals.SteacknCheese_panding += 1  
