extends Node

## The scene tree is the first place to experiment.
## This script only connects the small pieces together.

@onready var counter: ClickCounter = $UI/Counter
@onready var click_button: Button = $UI/ClickButton
@onready var instruction: Label = $UI/Instruction
@onready var narration: Narration = $UI/Narration

var stage := 0

func _ready() -> void:
	click_button.pressed.connect(_on_click_button_pressed)
	narration.say("Welcome. The button is waiting patiently.")

func _on_click_button_pressed() -> void:
	## Try one change at a time:
	## counter.add_click()
	## instruction.text = "your sentence here"
	## print(counter.value)
	if stage == 0:
		counter.add_click()
		narration.say("Good. A perfectly ordinary click.")
		if counter.value >= 5:
			stage = 1
			instruction.text = "keep clicking"
			narration.say("That was enough, thank you.")
	else:
		narration.say("The button heard you. It simply disagrees.")


## Later exercises:
## 1. Add a Timer node to the scene tree.
## 2. Connect its timeout signal to a new function here.
## 3. Give the button a new position in that function.
