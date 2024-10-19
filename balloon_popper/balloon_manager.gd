extends Node3D

var score : int = 0
var balloon_to_spawn : int = 5
@export var score_text : Label
var balloon_scene = preload("res://balloon_popper/balloon.tscn")



var balloons = []

func increase_score (amount):
	score += amount
	score_text.text = str("Score : ", score)

func _ready() -> void:
	spawn_balloons()

func spawn_balloons() -> void:
	for i in range(balloon_to_spawn):
		var new_balloon = balloon_scene.instantiate()
		var new_position = Vector3(randf_range(-6.0, 6.0), randf_range(-2.0, 2.0), randf_range(0.0, 3.0))
		new_balloon.clicks_to_pop = randi_range(1, 5)
		new_balloon.position = new_position
		new_balloon.connect("balloon_popped", Callable(self, "_on_balloon_popped"))
		add_child(new_balloon)
		balloons.append(new_balloon)

func _on_balloon_popped(balloon: Node) -> void:
	balloons.erase(balloon)
	if balloons.size() == 0:
		spawn_balloons()
