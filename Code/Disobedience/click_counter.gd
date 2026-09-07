class_name ClickCounter
extends Label

## A tiny component with one job: display a number.

var value := 0

func add_click() -> void:
	value += 1
	text = str(value)

func reset() -> void:
	value = 0
	text = str(value)
## Exercise: make a reset() function.
## Hint: set value to 0, then update text.
## Done! Now let's think if some random memes where reset and add_click rotate randomly but will add the logic somewhere else
