extends ColorRect


@export var target_shape: CollisionShape2D:
	set(new):
		if target_shape:
			push_error("Can't reassign target_shape on water.")
			return
		target_shape = new
		target_area = new.get_parent()
		update_visuals()
		
		target_area.body_entered.connect(_on_body_entered)
		target_area.body_exited.connect(_on_body_exited)

var target_area: Area2D


func _ready() -> void:
	if not target_shape:
		target_shape = get_parent()


func update_visuals() -> void:
	size = target_shape.shape.size
	position = size/-2


func _on_body_entered(body: PhysicsBody2D) -> void:
	if &"forces" in body:
		body.forces[self] = _get_body_force.bind(body)


func _on_body_exited(body: PhysicsBody2D) -> void:
	if &"forces" in body:
		body.forces.erase(self)


func _get_body_force(body: PhysicsBody2D) -> Vector2:
	var depth = max(
		0, 
		body.position.y - 15
		-(position.y - size.y) # Heighest position
	)
	
	var result: Vector2 = Vector2(0,
		-body.gravity
		- depth ** 1.1
	)# - body.velocity * 60 * 0.1
	
	if depth:
		result.y -= body.velocity.y * 60 * 0.1
	print(result.y)
	
	return result
