extends Node

const scene_level = preload("res://scenes/level_1.tscn")
const scene_level2 = preload("res://scenes/level_2.tscn")
const scene_level3 = preload("res://scenes/level_3.tscn")
const scene_end = preload("res://scenes/end_scene.tscn")
var spwan_door_tag 
# level transition contorler 
func level_transitions(level_tag, destination_tag):
	var scene_to_load 
	match level_tag:
		"level_1":
			scene_to_load = scene_level
		"level_2":
			scene_to_load = scene_level2
		"level_3":
			scene_to_load = scene_level3
		"end_scene":
			scene_to_load = scene_end
	if scene_to_load !=null:
		spwan_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
			
	
	
	
