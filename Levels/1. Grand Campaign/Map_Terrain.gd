extends Sprite2D
@onready var TileMap_terrain = $"../TileMap"
#Ground layer:
##004486 sea
##0044ff river
##008000 Grass
##b99256 Shore


func _ready():
	self.texture = load("res://Levels/1. Grand Campaign/Map/Map_Terrain - Small.png")

func load_terrain():
	var image = self.get_texture().get_image()
	var pixel_color_dict = {}
	for y in range(image.get_height()):
		for x in range(image.get_width()):
			var pixel_color = "#" + str(image.get_pixel(int(x), int(y)).to_html(false))
			if pixel_color not in pixel_color_dict:
				pixel_color_dict[pixel_color] = []
			pixel_color_dict[pixel_color].append(Vector2(x,y))

	TileMap_terrain.set_cells_terrain_connect(0,pixel_color_dict["#008000"],0,0,false) #Grass
	TileMap_terrain.set_cells_terrain_connect(0,pixel_color_dict["#004486"],0,1,false) #Sea

	queue_free()
