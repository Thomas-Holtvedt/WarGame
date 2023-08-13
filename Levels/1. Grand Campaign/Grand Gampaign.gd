extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().change_scene_to_file("res://Levels/0. Main Menu/Main Menu.tscn")
