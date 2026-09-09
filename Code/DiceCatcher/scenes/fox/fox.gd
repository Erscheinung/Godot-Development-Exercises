extends Area2D

@export var speed: float = 200.0
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.

func _physics_process(delta: float) -> void:
	#var move_left = Input.is_action_pressed("fox_left")
	#var move_right = Input.is_action_pressed("fox_right")
	#
	#var move: float = 0.0
	#if move_left: move -= 1.0
	#if move_right: move += 1.0
	#
	var move: float = Input.get_axis("fox_left", "fox_right")
	# flipping the sprite
	if !is_zero_approx(move):
		sprite_2d.flip_h = move > 0.0
	position.x = move * delta * speed
	
