extends Node2D
# @export var dice_scene: PackedScene
const DICE = preload("res://scenes/dice/dice.tscn")
# preload at compile time (const) and load at runtime (var)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	spawn_dice()
	
func spawn_dice() -> void:
	var new_dice: Dice = DICE.instantiate()
	add_child(new_dice)
	pass

func _on_spawn_timer_timeout() -> void:
	spawn_dice()
