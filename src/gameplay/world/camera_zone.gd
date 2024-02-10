@tool
extends Area2D

#@onready var shape: RectangleShape2D = $Zone.shape

const width: float = 2.0
const rect: Rect2 = Rect2(-256 - width/2, -256 - width/2 , 512 + width, 512 + width)

func _draw() -> void:
	draw_rect(rect, Color.DEEP_PINK, false, width)
