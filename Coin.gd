extends Area2D




func _on_Coin_body_entered(player):
	$AnimationPlayer.play("picked")
	Globals.coins_pending += 1
 
