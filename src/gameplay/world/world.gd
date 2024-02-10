extends Node2D

@onready var player: CharacterBody2D = %Player
@onready var camera_2d: Camera2D = %Camera2D
@onready var current_zone: Area2D

func _process(delta: float) -> void:
	if current_zone and current_zone.overlaps_body(player):
		return
	
	current_zone = null
	
	for camera_zone: Area2D in get_tree().get_nodes_in_group(&"camera_zone"):
		if camera_zone.overlaps_body(player):
			get_tree().call_group(&"camera_zone", &"hide")
			camera_2d.position_smoothing_enabled = false
			camera_2d.position = camera_zone.position
			current_zone = camera_zone
			return
	
	if current_zone == null:
		get_tree().call_group(&"camera_zone", &"show")
		camera_2d.position_smoothing_enabled = true
		camera_2d.position = player.position
