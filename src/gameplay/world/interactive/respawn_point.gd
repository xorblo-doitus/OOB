extends Area2D


@onready var line_2d: Line2D = $Line2D
@onready var polygon_2d: Polygon2D = $Polygon2D



func _ready() -> void:
	disable()
	update_material()


func _on_body_entered(body: Node2D) -> void:
	if &"respawn_position" in body:
		body.respawn_position = global_position
		get_tree().call_group(&"respawn_point", &"disable")
		polygon_2d.color = Color.YELLOW
		


func _set(property: StringName, _value: Variant) -> bool:
	match property:
		&"material":
			update_material()
	
	return false


func disable() -> void:
	polygon_2d.color = Color.GRAY


func update_material() -> void:
	if not is_node_ready():
		return
	
	polygon_2d.material = material
	line_2d.material = material
