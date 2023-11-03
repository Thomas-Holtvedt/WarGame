extends Node2D

func _ready():
	get_node("Map_Regions").load_regions()
	get_node("Map_Terrain").load_terrain()

##-------Input Functions-----##
func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().change_scene_to_file("res://Levels/0. Main Menu/Main Menu.tscn")
