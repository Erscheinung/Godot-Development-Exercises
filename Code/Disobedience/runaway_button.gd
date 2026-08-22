extends Button

## This script is intentionally quiet at first.
## Add behavior only after you have made the scene tree version work.

func move_a_little() -> void:
	position.x += 20.0


## Exercise: connect pressed to move_a_little() in the editor.
## Try changing 20.0, then try position.y instead.
