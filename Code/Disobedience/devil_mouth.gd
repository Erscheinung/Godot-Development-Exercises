class_name DevilMouth
extends Control

## A deliberately simple placeholder for the mouth you draw often.
## Replace the shapes in _draw() with your own art when you are ready.

var expression := 0.0

func _ready() -> void:
	custom_minimum_size = Vector2(280, 180)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	queue_redraw()

func set_expression(new_expression: float) -> void:
	## This is a small hook for future animation: try changing the mouth
	## shape based on this value instead of using one fixed expression.
	expression = new_expression
	queue_redraw()

func _draw() -> void:
	var center := size / 2.0
	var mouth_width: float = min(size.x * 0.72, 250.0)
	var mouth_height: float = 68.0 + expression * 12.0
	var outer := Rect2(center - Vector2(mouth_width, mouth_height) / 2.0, Vector2(mouth_width, mouth_height))

	# A red outline, black inside, and a few fangs are enough for now.
	draw_style_box(_rounded_box(Color("#d44761"), 8.0, 28.0), outer.grow(8.0))
	draw_style_box(_rounded_box(Color("#120b18"), 5.0, 24.0), outer)

	var tongue := PackedVector2Array([
		Vector2(center.x - 45, center.y + 18),
		Vector2(center.x + 45, center.y + 18),
		Vector2(center.x + 24, center.y + 42),
		Vector2(center.x, center.y + 50),
		Vector2(center.x - 24, center.y + 42)
	])
	draw_colored_polygon(tongue, Color("#a93259"))

	for fang_x in [-mouth_width * 0.30, -mouth_width * 0.12, mouth_width * 0.12, mouth_width * 0.30]:
		var fang := PackedVector2Array([
			Vector2(center.x + fang_x - 9, center.y - mouth_height / 2.0 + 4),
			Vector2(center.x + fang_x + 9, center.y - mouth_height / 2.0 + 4),
			Vector2(center.x + fang_x, center.y - mouth_height / 2.0 + 27)
		])
		draw_colored_polygon(fang, Color("#f5dfbf"))

func _rounded_box(color: Color, border_width: float, radius: float) -> StyleBoxFlat:
	var box := StyleBoxFlat.new()
	box.bg_color = color
	box.corner_radius_top_left = radius
	box.corner_radius_top_right = radius
	box.corner_radius_bottom_left = radius
	box.corner_radius_bottom_right = radius
	box.border_width_left = border_width
	box.border_width_right = border_width
	box.border_width_top = border_width
	box.border_width_bottom = border_width
	box.border_color = color
	return box
