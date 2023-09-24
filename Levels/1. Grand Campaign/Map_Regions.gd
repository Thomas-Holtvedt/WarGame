extends Sprite2D

func load_regions():
	# Go through all pixels in image and store color code and pixel coordinates in dictionary
	var image = self.get_texture().get_image()
	var pixel_color_dict = {}
	for y in range(image.get_height()):
		for x in range(image.get_width()):
			var pixel_color = "#" + str(image.get_pixel(int(x), int(y)).to_html(false))
			if pixel_color not in pixel_color_dict:
				pixel_color_dict[pixel_color] = []
			pixel_color_dict[pixel_color].append(Vector2(x,y))
			
	var regions_dict = import_file("res://Levels/1. Grand Campaign/Map/regions.txt")
	
	# Loop though dictionary values(region color)
	for region_color in regions_dict:
		var region =  load("res://Levels/1. Grand Campaign/Map/Region_Area.tscn").instantiate()
		region.region_name = regions_dict[region_color][0]
		region.region_continent = regions_dict[region_color][1]
		region.region_owner = regions_dict[region_color][2]
		region.set_name(region_color)
		get_node("../Regions").add_child(region)
		
		var targetimage = region.get_node("Sprite_region").get_texture().get_image()
		#for value in pixel_color_dict.get(region_color):
		for value in pixel_color_dict[region_color]:
			targetimage.set_pixel(value.x, value.y, "#ffffff")
			
		var bitmap = BitMap.new()
		bitmap.create_from_image_alpha(targetimage)
		var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
		
		var top_vector = polygons[0][0]
		var bottom_vector = polygons[0][0]
		var right_vector = polygons[0][0]
		var left_vector = polygons[0][0]

		for polygon in polygons:
			for vector in polygon:
				if vector.y < top_vector.y:
					top_vector = vector
				if vector.y > bottom_vector.y:
					bottom_vector = vector
				if vector.x > right_vector.x:
					right_vector = vector
				if vector.x < left_vector.x:
					left_vector = vector
			var region_collision = CollisionPolygon2D.new()	
			region_collision.polygon = polygon
			region.add_child(region_collision)

		var tl_vector = Vector2(left_vector.x, top_vector.y)
		var tr_vector = Vector2(right_vector.x, top_vector.y)
		var bl_vector = Vector2(left_vector.x, bottom_vector.y)
		var br_vector = Vector2(right_vector.x, bottom_vector.y)

		region.region_center = (tl_vector + tr_vector + bl_vector + br_vector)/4
		
		var newtexture = ImageTexture.new()
		newtexture = ImageTexture.create_from_image(targetimage)
		region.get_node("Sprite_region").texture = newtexture
		region.get_node("Sprite_region").modulate = Color( 0.5, 0.5, 0.5, 0)
		
		
## SYSTEM FUNCTIONS
#Import JSON files and converts to lists or dictionary
func import_file(filepath):
	var file = FileAccess.open(filepath, FileAccess.READ)
	if file != null:
		return JSON.parse_string(file.get_as_text().replace("_", " "))
	else:
		print("Failed to open file:", filepath)
		return null
