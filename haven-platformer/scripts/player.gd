extends CharacterBody2D

@export var ALLOW_JUMP := true;
const SPEED = 250.0
const JUMP_VELOCITY = -350.0

var gravity := 1;
var flipped := true;

func _physics_process(delta: float) -> void:
	if is_on_floor():
		flipped = false;
	
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity

	if Input.is_action_just_pressed("jump") and is_on_floor() and ALLOW_JUMP:
		velocity.y = JUMP_VELOCITY * gravity
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
	
	if Input.is_action_just_pressed("flip"):
		if not flipped:
			flipped = true;
			gravity *= -1;
			self.up_direction = Vector2(0, -gravity);
			self.rotation_degrees += 180;
		
	move_and_slide()

func _process(_delta: float) -> void:
	if self.position.y > 400 or self.position.y < -300:
		LevelManager.die();
