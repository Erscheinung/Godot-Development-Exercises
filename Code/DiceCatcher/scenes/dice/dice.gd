extends Area2D

const SPEED: float = 80.0
const ROTATION_SPEED: float = 2 * PI

@onready var sprite_2d: Sprite2D = $Sprite2D

var _rotation_speed: float = ROTATION_SPEED

func _ready() -> void:
	if randf() < 0.5:
		_rotation_speed *= -1
		

func _physics_process(delta: float) -> void:
	position.y += SPEED * delta
	sprite_2d.rotate(ROTATION_SPEED * delta)
