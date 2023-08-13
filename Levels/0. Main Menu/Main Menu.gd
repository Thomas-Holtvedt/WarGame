extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_play_button_up():
	get_tree().change_scene_to_file("res://Levels/1. Grand Campaign/Grand Gampaign.tscn")


func _on_button_ca_editor_button_up():
	get_tree().change_scene_to_file("res://Levels/9. Tools/Campaign Editor.tscn")


func _on_button_quit_button_up():
	get_tree().quit()

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit()
