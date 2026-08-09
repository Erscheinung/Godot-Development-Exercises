extends Node2D

## DISOBEDIENCE: a small learning project.
## The important idea is that this is a sequence of tiny, understandable
## states. You can add one state at a time instead of building a whole game.

const MOUTH_SCENE := preload("res://devil_mouth.gd")

var stage := 0
var click_count := 0
var missed_clicks := 0
var random := RandomNumberGenerator.new()

var count_label: Label
var instruction_label: Label
var narration_label: Label
var button: Button
var mouth: Control
var movement_timer: Timer

func _ready() -> void:
	random.randomize()
	_build_interface()
	_show_narration("Welcome. The button is waiting patiently.")

func _build_interface() -> void:
	# Everything is created in code so you can practice finding nodes and
	# changing their properties without needing an art pipeline yet.
	var background := ColorRect.new()
	background.color = Color("#090913")
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	background.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(background)

	var title := Label.new()
	title.text = "DISOBEDIENCE"
	title.position = Vector2(54, 38)
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f2d7a7"))
	add_child(title)

	count_label = Label.new()
	count_label.text = "0"
	count_label.position = Vector2(0, 115)
	count_label.size = Vector2(960, 100)
	count_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	count_label.add_theme_font_size_override("font_size", 82)
	count_label.add_theme_color_override("font_color", Color("#f4f0e8"))
	add_child(count_label)

	instruction_label = Label.new()
	instruction_label.text = "click the button"
	instruction_label.position = Vector2(0, 215)
	instruction_label.size = Vector2(960, 35)
	instruction_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	instruction_label.add_theme_font_size_override("font_size", 18)
	instruction_label.add_theme_color_override("font_color", Color("#8f8aa3"))
	add_child(instruction_label)

	button = Button.new()
	button.text = "CLICK"
	button.position = Vector2(350, 295)
	button.size = Vector2(260, 75)
	button.add_theme_font_size_override("font_size", 24)
	button.add_theme_color_override("font_color", Color("#160d17"))
	button.add_theme_stylebox_override("normal", _button_style(Color("#e8aa68")))
	button.add_theme_stylebox_override("hover", _button_style(Color("#ffd08a")))
	button.add_theme_stylebox_override("pressed", _button_style(Color("#c98255")))
	button.pressed.connect(_on_button_pressed)
	add_child(button)

	narration_label = Label.new()
	narration_label.position = Vector2(100, 430)
	narration_label.size = Vector2(760, 50)
	narration_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	narration_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	narration_label.add_theme_font_size_override("font_size", 17)
	narration_label.add_theme_color_override("font_color", Color("#d8bed0"))
	add_child(narration_label)

	movement_timer = Timer.new()
	movement_timer.wait_time = 0.65
	movement_timer.timeout.connect(_move_button_randomly)
	add_child(movement_timer)

func _on_button_pressed() -> void:
	## STEP 1: Add a breakpoint here and watch this function run.
	## STEP 2: Change click_count += 1 to click_count += 2.
	## STEP 3: Decide what should happen when click_count reaches 5.
	if stage == 0:
		click_count += 1
		count_label.text = str(click_count)
		_show_narration("Good. A perfectly ordinary click. Probably.")
		if click_count >= 5:
			stage = 1
			instruction_label.text = "keep clicking"
			_show_narration("That was enough, thank you. You may stop now.")
	elif stage == 1:
		missed_clicks += 1
		_show_narration("...nothing happened. That is unusual.")
		button.text = "CLICK?"
		if missed_clicks >= 3:
			stage = 2
			instruction_label.text = "the counter has chosen silence"
			_show_narration("You clicked three more times. The number remains five.")
	elif stage == 2:
		_show_narration("The button heard you. It simply disagrees.")
		stage = 3
		instruction_label.text = "catch it"
		button.text = "NO"
		movement_timer.start()
	elif stage == 3:
		_show_narration("Please stop chasing the button. It is becoming self-conscious.")
	else:
		_show_narration("The mouth is laughing at your excellent commitment.")

	if stage == 2:
		button.position += Vector2(8, 0)

func _move_button_randomly() -> void:
	# TODO for you: replace random movement with a smooth Tween.
	# Hint: create a tween, then tween_property(button, "position", ...).
	var new_position := Vector2(
		random.randf_range(80.0, 620.0),
		random.randf_range(285.0, 355.0)
	)
	button.position = new_position
	button.rotation = random.randf_range(-0.12, 0.12)
	if random.randf() > 0.65:
		stage = 4
		movement_timer.stop()
		button.visible = false
		instruction_label.text = "it has nothing left to say"
		_show_narration("Ha. Ha ha ha.\n(Placeholder narration — add voice acting later.)")
		_show_mouth()

func _show_mouth() -> void:
	mouth = MOUTH_SCENE.new()
	mouth.position = Vector2(340, 255)
	mouth.size = Vector2(280, 180)
	add_child(mouth)
	var tween := create_tween()
	mouth.modulate.a = 0.0
	tween.tween_property(mouth, "modulate:a", 1.0, 0.8)

func _show_narration(text: String) -> void:
	# This label is intentionally the voiceover placeholder.
	# Later, replace this function's label update with an AudioStreamPlayer.
	narration_label.text = text

func _button_style(color: Color) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.corner_radius_top_left = 12
	style.corner_radius_top_right = 12
	style.corner_radius_bottom_left = 12
	style.corner_radius_bottom_right = 12
	return style
