extends Area2D

var FLICK_FORCE = 100

var is_pressed = false
var start_pos

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			is_pressed = true
			start_pos = event.position
		elif event.button_index == BUTTON_LEFT and not event.is_pressed():
			var end_pos = event.position
			var flick_vector = start_pos - end_pos
			flick_vector = flick_vector.normalized() * FLICK_FORCE
			var global_transform = get_global_transform()
			global_transform.origin += flick_vector
			set_global_transform(global_transform)
			is_pressed = false
