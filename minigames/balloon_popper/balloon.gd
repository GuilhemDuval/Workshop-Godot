extends Area3D

@export var clicks_to_pop : int = 3
var size_increase : float = 0.2
var score_to_give : int = 1


var float_speed : float = 1.2
var float_height : float = 0.3
var time_offset : float = 0.0

var move_speed : float = 1.0
var move_range : float = 0.6

var time_passed : float = 0.0

signal balloon_popped

func _ready() -> void:
	time_offset = randf() * 6.28318
	connect("balloon_popped", Callable(self, "_on_balloon_popped")) 

func _on_balloon_popped(_balloon):
	print("Balloon popped!")
	
func _process(delta: float) -> void:
	# Ajoute le delta au temps écoulé
	time_passed += delta

	# Calcul du mouvement vertical avec une sinusoïde
	var float_y = float_height * sin(float_speed * (time_offset + time_passed))

	# Ajoute un léger mouvement horizontal (oscillation sur X et Z)
	var offset_x = move_range * sin(move_speed * (time_offset + time_passed))
	var offset_z = move_range * cos(move_speed * (time_offset + time_passed))
	
	# Applique le déplacement à la position actuelle
	position += Vector3(offset_x * delta, float_y * delta, offset_z * delta)

func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		scale += Vector3.ONE * size_increase
		clicks_to_pop -= 1
		
		if clicks_to_pop == 0:
			#get_node("/root/TestDialogue/SubViewportContainer2/SubViewport/Main2").increase_score(score_to_give)
			get_parent().increase_score(score_to_give)
			emit_signal("balloon_popped", self)
			queue_free()
