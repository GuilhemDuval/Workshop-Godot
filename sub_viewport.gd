extends SubViewport

var minigame_balloon = preload("res://minigames/balloon_popper/balloon_popper.tscn")
var minigame_ski = preload("res://minigames/collision/collision.tscn")
var minigame_physics = preload("res://minigames/physics/physics.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var minigame = minigame_physics.instantiate()
	add_child(minigame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
