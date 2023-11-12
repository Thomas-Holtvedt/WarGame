extends Sprite2D
@onready var TileMap_terrain = $"../TileMap"
@onready var betterterrain = $"../TileMap/BetterTerrain"

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

	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#008000"],1) #Grass
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#947f2d"],2) #Desert
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#004486"],3) #Sea
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#6e7f2d"],4) #Steppe
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#034103"],5) #Dark Grass
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#d5d9dc"],6) #snow
	betterterrain.set_cells(TileMap_terrain,0,pixel_color_dict["#539353"],7) #Tundra
	
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#008000"],1) #Grass
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#947f2d"],2) #Desert
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#004486"],3) #Sea
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#6e7f2d"],4) #Steppe
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#034103"],5) #Dark Grass
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#d5d9dc"],6) #snow
	betterterrain.update_terrain_cells(TileMap_terrain,0,pixel_color_dict["#539353"],7) #Tundra

	queue_free()
