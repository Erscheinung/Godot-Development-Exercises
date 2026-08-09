# Disobedience: a tiny Godot learning project

This is a deliberately small Godot 4.5.1 prototype. It begins as a click counter, then the counter stops responding, the button moves, and a simple drawn devil mouth appears. The narration is text for now so it can become voice acting later.

## Run it

1. Open Godot 4.5.1.
2. Choose **Import** and select this folder.
3. Press **F6** if you want to run the current scene, or **F5** to run the project.
4. Click five times, then keep clicking. The game is supposed to misbehave.

## A gentle way to learn from it

1. Open `main.gd` and find `_on_button_pressed()`.
2. Add `print(click_count)` below `click_count += 1`, run the game, and watch Godot's **Output** panel.
3. Change the first narration sentence. Run the game again and notice the result.
4. In `_move_button_randomly()`, change `0.65` to `0.2`. This changes how often the button tries a new position.
5. Read the `TODO` comments and try only one small change at a time.

The most useful habit is to make a tiny change, run the game, and observe what changed. You do not need to understand every line before experimenting.

## Next small exercises

- Add a reset button that sets `click_count` and `stage` back to zero.
- Give each stage its own function, such as `enter_silent_stage()`.
- Add a second line of narration and show it after a short Timer delay.
- Replace the mouth's `_draw()` shapes with an image or your own SVG later.
- Add an `AudioStreamPlayer` where `_show_narration()` currently changes the label.
