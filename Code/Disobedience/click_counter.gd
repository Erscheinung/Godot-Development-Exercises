class_name ClickCounter
extends Label

## A tiny component with one job: display a number.

var value := 0

func add_click() -> void:
	value += 1
	text = str(value)


## Exercise: make a reset() function.
## Hint: set value to 0, then update text.
