extends Area2D

var FLICK_FORCE = 100
var start_pos

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			start_pos = event.position
		elif event.button_index == BUTTON_LEFT and not event.is_pressed():
			var end_pos = event.position
			var flick_vector = start_pos - end_pos
			flick_vector = flick_vector.normalized() * FLICK_FORCE
			
			position += flick_vector
