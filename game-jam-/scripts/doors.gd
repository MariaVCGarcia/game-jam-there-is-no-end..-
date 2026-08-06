class_name Door  extends Area2D

@export var destination_level_tag: String
@export var destitantion_door_tag: String
@export var spawn_direction = "up"
@onready var spawn = $spwan

func _on_body_entered(body: CharacterBody2D) -> void:
	if body == Player:
		LevelTransition.got_to_level(destination_level_tag,destitantion_door_tag)
