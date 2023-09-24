extends Node2D

var region_name = "temp"
var region_continent = "temp"
var region_owner = "temp"
var region_center = Vector2(0,0)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		clear_selection()
		$Sprite_region.modulate = Color( 1, 1, 1, 0.5)
		print("click")

func _on_mouse_entered():
	pass
#	$Sprite_region.modulate = Color(1, 1, 1, 0.3)
#	print("enter")

func _on_mouse_exited():
	pass
#	$Sprite_region.modulate = Color(1, 1, 1, 0)
#	print("exit")

func clear_selection():
	for region in get_parent().get_children():
		region.get_node("Sprite_region").set_modulate(Color( 1, 1, 1, 0))
