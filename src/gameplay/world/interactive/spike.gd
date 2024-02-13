@tool
extends Area2D

@onready var polygon_2d: Polygon2D = $Polygon2D

func _ready() -> void:
	update_material()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method(&"kill"):
		body.kill()



func _set(property: StringName, _value: Variant) -> bool:
	match property:
		&"material":
			update_material()
	
	return false


func update_material() -> void:
	if not is_node_ready():
		return
	
	polygon_2d.material = material
