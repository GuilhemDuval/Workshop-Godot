extends AnimatedSprite2D

var current_frame = 0
var current_progress = 0.0
var speed = 1.0 # Vitesse d'animation

func _ready() -> void:
	play("jump")

func _process(delta: float) -> void:
	current_frame = get_frame()
	current_progress = get_frame_progress()

	current_progress += delta * speed

	if current_progress >= 1.0:
		current_frame += 1
		current_progress = 0.0

		if current_frame >= sprite_frames.get_frame_count("walk"):
			current_frame = 0

	set_frame_and_progress(current_frame, current_progress)
