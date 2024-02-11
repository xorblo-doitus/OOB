extends Area2D


@onready var polygon_2d: Polygon2D = $Polygon2D



func _ready() -> void:
	disable()


func _on_body_entered(body: Node2D) -> void:
	if &"respawn_position" in body:
		body.respawn_position = global_position
		get_tree().call_group(&"respawn_point", &"disable")
		polygon_2d.color = Color.RED
		


func disable() -> void:
	polygon_2d.color = Color.GRAY
