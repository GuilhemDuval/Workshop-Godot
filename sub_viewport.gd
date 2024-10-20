extends SubViewport

var minigame_balloon = preload("res://minigames/balloon_popper/balloon_popper.tscn")
var minigame_ski = preload("res://minigames/collision/collision.tscn")
var minigame_chess = preload("res://minigames/physics/physics.tscn")
var minigame_coin = preload("res://minigames/coin_collector/coin_collector_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var minigame = minigame_coin.instantiate()
	add_child(minigame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
