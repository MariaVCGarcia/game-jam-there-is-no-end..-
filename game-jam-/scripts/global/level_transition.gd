extends Node

const Scene_main = preload("res://scenes/level_1.tscn")
const Scene_Next_level = preload("res://scenes/level_2.tscn")

var spawn_door_tag
func got_to_level(destination_Level_tag,destination_door_tag):
	var scene_to_load 
	match destination_Level_tag:
		"level_1":
			scene_to_load = Scene_main
		"Level_2":
			scene_to_load = Scene_Next_level
	if scene_to_load != null:
		spawn_door_tag = destination_door_tag
		get_tree().change_scene_to_packed(scene_to_load)
