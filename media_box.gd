extends TextureRect

@export var hidden_position: Vector2
@export var visible_position: Vector2
@export var transition_duration: float = 0.5

var tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move_panel(target_position: Vector2) -> void:
	if tween:
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(self, "position", target_position, transition_duration)

func move_visible() -> void:
	move_panel(visible_position)
	
func move_hidden() -> void:
	move_panel(hidden_position)
