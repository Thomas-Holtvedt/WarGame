extends Node2D

var region_name = "temp"
var region_continent = "temp"
var region_owner = "temp"
var region_center = Vector2(0,0)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		clear_selection()
		for node in get_children():
			if node.is_class("Polygon2D"):
				node.color = Color(1, 0, 0, 1)

func _on_mouse_entered():
	for node in get_children():
				if node.is_class("Polygon2D"):
					node.modulate = Color( 1, 1, 1, 0.5)

func _on_mouse_exited():
	for node in get_children():
				if node.is_class("Polygon2D"):
					node.modulate = Color( 1, 1, 1, 1)

func clear_selection():
	for region in get_parent().get_children():
		for node in region.get_children():
			if node.is_class("Polygon2D"):
				node.color = Color(1, 1, 1, 1)
