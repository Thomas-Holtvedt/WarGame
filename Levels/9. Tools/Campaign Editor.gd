extends Node2D
@onready var map_image = $Sprite2D
var list_continents = []

# Called when the node enters the scene tree for the first time.
func _ready():
	self.list_continents = import_file("res://Levels/1. Grand Campaign/Map/continents.txt")
	load_continents()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().change_scene_to_file("res://Levels/0. Main Menu/Main Menu.tscn")

func import_file(filepath):
	var file = FileAccess.open(filepath, FileAccess.READ)
	if file != null:
		print("File loaded successfully")
		return JSON.parse_string(file.get_as_text())
	else:
		print("Failed to open file:", filepath)
		return null

func load_continents():
	if list_continents == null:
		self.list_continents = ["NA"]
	for lines in self.list_continents:
		var line_continent = LineEdit.new()
		line_continent.text = lines
		print(lines)
		if lines != "NA":
			get_node("CanvasLayer/MenuBar/PM_continents").add_child(line_continent)
		#get_node("CanvasLayer/Panel_region/VB/GC/Continent").add_item(lines)
