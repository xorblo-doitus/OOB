@tool
extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var line_2d: Line2D = $Line2D

@export var width: float = 50:
	set(new):
		width = new
		if not is_node_ready():
			ready.connect(update_width, CONNECT_ONE_SHOT)
			return
		update_width()


func update_width() -> void:
	collision_shape_2d.shape.a.x = width/-2
	collision_shape_2d.shape.b.x = width/2
	line_2d.points[0].x = width/-2
	line_2d.points[1].x = width/2
