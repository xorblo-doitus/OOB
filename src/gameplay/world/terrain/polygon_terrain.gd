@tool
extends Polygon2D

@onready var collision: CollisionPolygon2D = %Collision

func _set(property: StringName, value: Variant) -> bool:
	if property == &"polygon":
		if not is_node_ready():
			set_deferred(&"polygon", value)
			return false
		collision.polygon = value
	
	return false
