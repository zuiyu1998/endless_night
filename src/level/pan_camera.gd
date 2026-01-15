extends Camera2D
class_name PanCamera

@export_category("zoom")
# 相机缩放的最小倍数
@export
var min_zoom: float = 0.2
# 相机缩放的最大倍数
@export
var max_zoom: float = 4

@export
var max_zoom_rate: float = 1000

# 每次变化的幅度
var zoom_rate: float = 500

func _ready() -> void:
	zoom_rate = max_zoom_rate / 2.0
	update_zoom()


func update_zoom():
	var v = clampf(zoom_rate, 0, max_zoom_rate) * 1.0 / max_zoom_rate * (max_zoom - min_zoom) + min_zoom
	zoom = Vector2(v, v)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_rate += 1
			update_zoom()
		elif mouse_event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_rate -= 1
			update_zoom()
