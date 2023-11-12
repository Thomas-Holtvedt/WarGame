extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Map_Terrain").load_terrain()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
