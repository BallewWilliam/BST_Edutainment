extends Node



@export var NodeValue = 20
var NodeString = str(NodeValue)
@export var dragging = false
signal dragsignal
signal CheckValue


func _ready():
	dragsignal.connect(_set_drag_pc)
	$Label.set_text(NodeString)


func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging=!dragging


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()


func _on_area_2d_area_entered(area):
	print("White entered!")
	CheckValue.emit(NodeValue)
