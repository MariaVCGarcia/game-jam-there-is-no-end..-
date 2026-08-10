extends Node2D

@export var destination_level_tag: String 
@export var destination_door_tag: String 
@export var spawn_direction: String

@onready var spawn = $Area2D/spawn

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.level_transitions(destination_level_tag,destination_door_tag)
	
