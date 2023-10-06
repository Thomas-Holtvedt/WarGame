extends Camera2D

var mouse_left = false
var mouse_right = false
var mouse_up = false
var mouse_down = false

func zoom_in():
	var current_zoom = self.zoom
	self.set_zoom(current_zoom * 1.05)
	
func zoom_out():
	var current_zoom = self.zoom
	self.set_zoom(current_zoom * 0.95)
	
#Drag around camera
func move_offset(event):
	var rel_x = event.relative.x
	var rel_y = event.relative.y
	var cam_pos = self.get_offset()
	var current_zoom = self.zoom
	
	cam_pos.x -= rel_x / current_zoom.x
	cam_pos.y -= rel_y / current_zoom.y
	self.set_offset(cam_pos)

func _unhandled_input(event):
	if event is InputEventMouseMotion and event.button_mask > 0:
		self.move_offset(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		self.zoom_in()
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		self.zoom_out()

func _process(delta):
	var current_zoom = self.zoom
	var speed = 300
	if Input.is_action_pressed("ui_right") or mouse_right:
		position.x += (speed / current_zoom.x) * delta
	if Input.is_action_pressed("ui_left") or mouse_left:
		position.x -= (speed / current_zoom.x) * delta
	if Input.is_action_pressed("ui_up") or mouse_up:
		position.y -= (speed / current_zoom.x) * delta
	if Input.is_action_pressed("ui_down") or mouse_down:
		position.y += (speed / current_zoom.x) * delta
	

func _on_area_2d_mouse_entered():
	self.mouse_left = true
func _on_area_2d_mouse_exited():
	self.mouse_left = false

func _on_area_2d_bounds_right_mouse_entered():
	self.mouse_right = true
func _on_area_2d_bounds_right_mouse_exited():
	self.mouse_right = false

func _on_area_2d_bounds_up_mouse_entered():
	self.mouse_up = true
func _on_area_2d_bounds_up_mouse_exited():
	self.mouse_up = false

func _on_area_2d_bounds_down_mouse_entered():
	self.mouse_down = true
func _on_area_2d_bounds_down_mouse_exited():
	self.mouse_down = false
