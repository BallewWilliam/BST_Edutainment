extends Area2D
@export var CheckerValue = 0

func _ready():
	pass

func _on_area_entered(area):
	print("Entered!")


func _on_area_exited(area):
	print("Exited!")


func _on_check_value(NodeValue):
	print("bbbbb")
	var Checker = NodeValue
	print(Checker)
	if Checker == CheckerValue:
		print("Cool!")
	else:
		print('Die :)')
	
