extends Node2D

const seed = preload("res://minigames/coin_collector/coin.tscn")

var spawn_timer : Timer

func _ready() -> void:
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 1.0
	spawn_timer.one_shot = false
	spawn_timer.connect("timeout", Callable(self, "_spawn_seed"))
	add_child(spawn_timer)
	spawn_timer.start()

func _spawn_seed() -> void:
	var new_seed = seed.instantiate()
	add_child(new_seed)
	var random_x = randi_range(-200, 200)
	var random_y = randi_range(-100, 100)
	new_seed.position = Vector2(random_x, random_y)
