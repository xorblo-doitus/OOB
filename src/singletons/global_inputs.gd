extends Node

## Input singleton running constantly


func _process(_delta) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		# Get opposite state as current
		var now_fullscreen = get_window().mode != Window.MODE_FULLSCREEN
		
		print("set fullscreen to ", now_fullscreen)
		if now_fullscreen:
			get_window().mode = Window.MODE_FULLSCREEN
		else:
			get_window().mode = Window.MODE_WINDOWED
	
	if Input.is_action_just_pressed("screenshot"):
		var capture = get_viewport().get_texture().get_image()
		var _time = Time.get_unix_time_from_system()
		DirAccess.make_dir_recursive_absolute("user://screenshots/")
		var filename = "user://screenshots/screenshot-{0}.png".format({"0":_time})
		capture.save_png(filename)
		print("screenshot saved under ", ProjectSettings.globalize_path(filename))
