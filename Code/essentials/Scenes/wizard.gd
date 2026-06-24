class_name Wizard
extends Node2D

signal cast_spell

@export var reveal_timer: Timer
@export var spell_timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.
	

func _on_reveal_timer_timeout() -> void:
	show() # Replace with function body.


func _on_spell_timer_timeout() -> void:
	cast_spell.emit()
	
func hit_by_hobbit() -> void:
	scale = Vector2(0.5,0.5)
	set_process(false)
	
	
