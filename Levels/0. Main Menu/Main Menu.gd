extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Map_Terrain").load_terrain()
	#Tilemap.tilemap_reference = $TileMap
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_node("Camera2D").offset.x += 1


func _on_button_play_button_up():
	get_tree().change_scene_to_file("res://Levels/1. Grand Campaign/Grand Gampaign.tscn")


func _on_button_ca_editor_button_up():
	get_tree().change_scene_to_file("res://Levels/9. Tools/Campaign Editor.tscn")


func _on_button_quit_button_up():
	get_tree().quit()

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit()
