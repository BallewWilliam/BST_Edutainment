extends Node


var dragging = false
signal dragsignal


func _ready():
	dragsignal.connect(_set_drag_pc)


func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging=!dragging


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print_debug("Pressed!")
			emit_signal("dragsignal")
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			print_debug("Unpressed!")
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()
