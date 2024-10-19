extends Panel

@export var hidden_position: Vector2
@export var visible_position: Vector2
@export var transition_duration: float = 0.5

var elapsed_time: float = 0.0

var tween

func _ready() -> void:
	check_for_button_and_toggle_visibility()

func _process(delta: float) -> void:
	elapsed_time += delta

	if elapsed_time >= 2.0:
		elapsed_time = 0.0
		check_for_button_and_toggle_visibility()

func check_for_button_and_toggle_visibility() -> void:
	var button_exists = check_for_visible_button(self)
	if button_exists:
		move_panel(visible_position)
	else:
		move_panel(hidden_position)

func check_for_visible_button(node: Node) -> bool:
	for child in node.get_children():
		if child is Button and child.visible:
			return true
		if child.get_child_count() > 0:
			if check_for_visible_button(child):
				return true
	return false

func move_panel(target_position: Vector2) -> void:
	if tween:
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(self, "position", target_position, transition_duration)
