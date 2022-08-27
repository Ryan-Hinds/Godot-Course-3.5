extends KinematicBody2D

export var speed := 600.0
export var gravity := 4500.0
export var jump_strengths := [1400.0, 1000.0]

var jump_number := 0
var velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	var horizontal_direction := Input.get_axis("move_left", "move_right")
	velocity.x = horizontal_direction * speed
	velocity.y += gravity * delta

	var is_jumping := Input.is_action_just_pressed("jump")
	var is_jump_cancelled := Input.is_action_just_released("jump") and velocity.y < 0.0
	# Make sure the character can only jump twice.
	# Hint: you will need to add "and" to the if, and a new condition
	var can_jump := true
	if is_jumping:
		# Make sure the current jump is applied here
		# Make also sure the jump number is increased
		jump_number = 1
		velocity.y += -jump_strengths[0]
		if jump_number < jump_strengths.size() and can_jump:
			jump_number += 1
			velocity.y += -jump_strengths[1]
			can_jump = false
	elif is_jump_cancelled:
		velocity.y = 0.0
	elif is_on_floor():
		jump_number = 0
		can_jump = true
	velocity = move_and_slide(velocity, Vector2.UP)
