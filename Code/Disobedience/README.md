# Disobedience

A small Godot 4.5.1 learning scene. The project is deliberately built in the editor: the scene tree is part of the exercise, and the scripts only provide tiny pieces of behavior.

## Start here

1. Open the folder in Godot.
2. Open `main.tscn` and press F6.
3. In the Scene dock, click `UI/ClickButton`, `UI/Counter`, and `UI/Narration`.
4. Change one Inspector property, run the scene, and observe the result.

## Small prompts

### 1. Make the scene yours

- Select `UI/Title` and change its text and color.
- Select `UI/ClickButton` and change its text.
- Move the button by editing its Layout offsets.

### 2. Follow one click

Open `main.gd`. Read `_on_click_button_pressed()`.

- Uncomment `print(counter.value)`.
- Run the scene and click five times.
- Change the narration sentence.

### 3. Add a node

- Add a `Label` as a child of `UI`.
- Give it the name `Hint` and some text in the Inspector.
- In `main.gd`, add `@onready var hint: Label = $UI/Hint`.
- Change `hint.text` after the first click.

### 4. Give the button a little disobedience

Open `runaway_button.gd`.

- Connect `pressed` to `move_a_little()` in the Node dock.
- Change `20.0` to another number.
- Try moving `position.y` instead of `position.x`.

### 5. Make a reset

Open `click_counter.gd` and complete the commented `reset()` exercise. Add a second Button node in the editor, then connect it to that function.

### Later

Add a `Timer` node, an `AudioStreamPlayer`, or a `TextureRect` for the devil's mouth. Build each new idea as a node first, then add only the small script it needs.

The project should stay incomplete. That is the point: make a change, run it, and see what the game does.
