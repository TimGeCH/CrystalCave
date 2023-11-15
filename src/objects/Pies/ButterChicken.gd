extends Area2D
 
func _on_ButterChicken_body_entered(body):
	$AnimationPlayer.play("PiePicked")
	Globals.ButterChicken_panding += 1  
