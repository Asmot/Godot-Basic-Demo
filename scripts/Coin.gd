extends Area

signal CoinHitSingal

func _ready():
	pass


func _exit_tree():
	print ("coin remove ")

func _on_Coin_body_entered(body):
	print ("hit coin " + body.name)
	if (body.name == "Player"):
		print ("hit coin by player")
		
		# start a jump
		$AnimationPlayer.play("jump_animation")
		# after the timer will queue
		$Timer.start()
		

func _on_Timer_timeout():
	emit_signal("CoinHitSingal");
	queue_free()
