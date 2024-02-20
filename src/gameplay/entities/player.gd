extends CharacterBody2D


var speed: float = 300.0
var jump_velocity: float = -400.0
var coyote_time_s: float = 0.1

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var forces: Dictionary = {}

var _not_on_floor_since_s: float = 0.0

var respawn_position: Vector2 = Vector2(289, 412)

@onready var death_sound: AudioStreamPlayer = $DeathSound


var _stop_movement_s: float = 0
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("respawn"):
		respawn()
		return
	
	get_tree().set_group(&"one_way", "disabled", Input.get_action_strength(&"down") > 0.5)
	
	for force in forces.values():
		if force is Callable:
			force = force.call()
		
		velocity += force * delta
	
	if is_on_floor():
		_not_on_floor_since_s = 0.0
	else:
		_not_on_floor_since_s += delta
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and _not_on_floor_since_s < coyote_time_s:
		velocity.y = jump_velocity
	
	var direction := Input.get_axis("left", "right")
	
	if _stop_movement_s > 0:
		if not direction:
			_stop_movement_s = 0
		else:
			_stop_movement_s -= delta
	else:
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()


func kill() -> void:
	death_sound.play()
	respawn()


func respawn() -> void:
	velocity = Vector2.ZERO
	global_position = respawn_position
	_stop_movement_s = 0.3
