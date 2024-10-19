extends AnimatedSprite2D

var current_animation: String = "wiggle"
var current_frame = 0
var current_progress = 0.0
var speed = 1.0

@export var talk_sound : AudioStreamPlayer

func _ready() -> void:
	play(current_animation)
	

func connexions() -> void:
	var dialogue_node = get_parent().get_parent().get_node("ExampleBalloon/Balloon/Panel/Dialogue/VBoxContainer/DialogueLabel")
	dialogue_node.connect("spoke", Callable(self, "_on_dialogue_label_spoke"))
	dialogue_node.connect("finished_typing", Callable(self, "_on_dialogue_label_finished_typing"))

func _process(delta: float) -> void:
	current_frame = get_frame()
	current_progress = get_frame_progress()

	current_progress += delta * speed

	if current_progress >= 1.0:
		current_frame += 1
		current_progress = 0.0

		if current_frame >= sprite_frames.get_frame_count(current_animation):
			current_frame = 0

	set_frame_and_progress(current_frame, current_progress)

func change_animation(new_animation: String) -> void:
	if new_animation != current_animation:
		current_animation = new_animation
		play(current_animation)
		current_frame = 0
		current_progress = 0.0
		
func _on_dialogue_label_spoke(letter: String, letter_index: int, speed: float) -> void:
	change_animation("walk")
	if letter in [" "]:
		talk_sound.pitch_scale = randf_range(0.9, 1.1)
		talk_sound.play()
		
		
func _on_dialogue_label_finished_typing():
	change_animation("wiggle")
