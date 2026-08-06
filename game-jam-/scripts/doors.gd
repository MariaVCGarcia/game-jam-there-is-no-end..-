class_name Door  extends Area2D

#trying to get the level transitions to wokr but the area is not registering the player.
#will work on this tomorrow.
func _on_body_entered(body) -> void:
	if body == Player:
		print("enterd")
