extends Node2D

const Ballon = preload("res://balloon.tscn")
var music_player : AudioStreamPlayer

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"
@onready var duck : AnimatedSprite2D = get_node("PaintBox/DuckSprite")
@onready var media_box : TextureRect = get_node("MediaBox")
@onready var minigame : SubViewport = get_node("MinigameScreen/SubViewportContainer/SubViewport")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player = get_node("007Synthwave421k")
	music_player.play()
	var ballon: Node = Ballon.instantiate()
	get_tree().current_scene.add_child(ballon)
	ballon.start(dialogue_resource, dialogue_start)
	duck.connexions()

func reload_scene() -> void:
	get_tree().reload_current_scene()

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		reload_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_F):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
