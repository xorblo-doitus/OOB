@tool
extends Label

@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var shape: RectangleShape2D = collision_shape_2d.shape


func _ready() -> void:
	update_size()


func _on_resized() -> void:
	update_size()


func update_size() -> void:
	if not is_node_ready():
		return
	collision_shape_2d.position = size/2.0
	shape.size = size
