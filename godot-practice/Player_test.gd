extends KinematicBody2D

const SPEED := 700.0
const DIRECT_TO_FRAME := {
	Vector2.DOWN: 0,
	Vector2.DOWN + Vector2.RIGHT: 1,
	Vector2.RIGHT: 2,
	Vector2.UP + Vector2.RIGHT: 3,
	Vector2.UP: 4,
}

onready var sprite := $Godot


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var velocity := direction * SPEED
	move_and_slide(velocity)
	# The Vector2.round() function returns a new Vetcor2 with both "x" and "y"
	# rounded out
	var direction_key := direction.round()
	# The abs() function makes neg numbers positive
	direction_key.x = abs(direction_key.x)
	
	if direction_key in DIRECT_TO_FRAME:
		sprite.frame = DIRECT_TO_FRAME[direction_key]
		sprite.flip_h = sign(direction.x) == -1

