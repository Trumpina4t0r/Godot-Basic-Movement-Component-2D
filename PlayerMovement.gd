extends Node2D

@export var SPEED = 300.0
@export var sprite_2d: AnimatedSprite2D
@onready var root = get_parent()
var direction
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("MoveA","MoveD","MoveW","MoveS")
	#mobile control
	if direction:
		root.velocity.x = direction.x * SPEED
		root.velocity.y = direction.y * SPEED 
		AnimatedSprite(direction)
		
	#slow down the character
	else:
		root.velocity.x = move_toward(root.velocity.x,0, SPEED)
		root.velocity.y = move_toward(root.velocity.y,0, SPEED)
		sprite_2d.animation = "Idle"
	root.move_and_slide()

func AnimatedSprite(direction):
	if abs(direction.x) > 0:
		sprite_2d.animation = "MoveSides"
		sprite_2d.flip_h = direction.x > 0
	elif direction.y > 0:
		sprite_2d.animation = "MoveDown"
	elif direction.y < 0:
		sprite_2d.animation = "MoveUp"
	
