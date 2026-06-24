class_name Hobbit

extends Node2D
signal kill_wizard

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit_wizard"):
		kill_wizard.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	
func _process(delta: float) -> void:
	rotate(PI * delta)

func hit_by_spell() -> void:
	scale = Vector2(0.5,0.5)
	set_process(false)
	
