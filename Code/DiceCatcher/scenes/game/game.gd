extends Node2D
# @export var dice_scene: PackedScene
const DICE = preload("res://scenes/dice/dice.tscn")
# preload at compile time (const) and load at runtime (var)
const GAME_OVER = preload("uid://eii2vgkwahql")

var _score: int = 0

@onready var score_label: Label = $ScoreLabel
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	get_tree().paused = false
	spawn_dice()
	
func spawn_dice() -> void:
	var new_dice: Dice = DICE.instantiate()
	new_dice.off_screen.connect(game_over)
	add_child(new_dice)

func game_over() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()


func _on_spawn_timer_timeout() -> void:
	spawn_dice()

func _on_fox_eaten_dice() -> void:
	_score += 1
	score_label.text = "%04d" % _score
