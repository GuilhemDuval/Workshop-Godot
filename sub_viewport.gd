extends SubViewport

var minigame_balloon = preload("res://minigames/balloon_popper/balloon_popper.tscn")
var minigame_ski = preload("res://minigames/collision/collision.tscn")
var minigame_chess = preload("res://minigames/physics/physics.tscn")
var minigame_coin = preload("res://minigames/coin_collector/coin_collector_scene.tscn")

var current_minigame : Node = null  # Référence au jeu en cours

func _ready() -> void:
	load_minigame(0)  # Charge par défaut le minigame avec ID 3 (coin_collector)

# Fonction pour changer le minigame selon l'ID
func load_minigame(minigame_id: int) -> void:
	# Supprimer le minijeu actuel s'il y en a un
	if current_minigame != null:
		remove_child(current_minigame)
		current_minigame.queue_free()
		current_minigame = null

	# Instancier et ajouter le minigame selon l'ID donné
	match minigame_id:
		0:
			current_minigame = minigame_balloon.instantiate()
		1:
			current_minigame = minigame_ski.instantiate()
		2:
			current_minigame = minigame_chess.instantiate()
		3:
			current_minigame = minigame_coin.instantiate()
		_:
			print("Invalid minigame ID")

	if current_minigame != null:
		add_child(current_minigame)
