extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/connor_test_scene.tscn")
	# Replace test scene with main game scene

func _on_quit_pressed():
	get_tree().quit()
