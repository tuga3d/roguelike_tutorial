extends Sprite

func _ready() -> void:
	position = get_viewport_rect().get_center().round()

func _unhandled_key_input(event: InputEventKey) -> void:
	if not event.pressed or event.echo:
		return

	if event.scancode == KEY_UP:
		move(Vector2.UP)
	elif event.scancode == KEY_DOWN:
		move(Vector2.DOWN)
	elif event.scancode == KEY_LEFT:
		move(Vector2.LEFT)
	elif event.scancode == KEY_RIGHT:
		move(Vector2.RIGHT)

func move(direction: Vector2) -> void:
	var __ # discard variable

	var duration := 0.3
	var end_position := direction * Global.TILE_SIZE
	var end_scale := Vector2(0.5, 0.5) + direction.abs()

	flip_h = true if direction.x == 1 else false
	flip_v = true if direction.y == 1 else false

	var position_tween := create_tween()
	__ = position_tween.tween_property(
			self, "position", end_position, duration
			).set_trans(Tween.TRANS_BACK).as_relative()

	var scale_tween := create_tween()
	__ = scale_tween.tween_property(self, "scale", end_scale, duration * 0.5)
	__ = scale_tween.tween_property(self, "scale", Vector2.ONE, duration * 0.5)
