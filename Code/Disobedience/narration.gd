class_name Narration
extends Label

## Keeping narration separate makes it easy to replace text with audio later.

func say(message: String) -> void:
	text = message


## Exercise: add a second Label for a speaker name.
## Then give it a small change inside say().
