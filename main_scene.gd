extends Node2D

const Ballon = preload("res://balloon.tscn")
var music_player : AudioStreamPlayer

@export var dialogue_resource : DialogueResource
@onready var duck : AnimatedSprite2D = get_node("PaintBox/DuckSprite")
@onready var media_box : TextureRect = get_node("MediaBox")
@onready var minigame : SubViewport = get_node("MinigameScreen/SubViewportContainer/SubViewport")

var ballon : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player = get_node("007Synthwave421k")
	music_player.play()
	ballon = Ballon.instantiate()
	get_tree().current_scene.add_child(ballon)
	ballon.start(dialogue_resource, Global.dialogue_start)
	duck.connexions()

func reload_scene() -> void:
	get_tree().reload_current_scene()

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		Global.dialogue_start = "start"
		reload_scene()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_F) or Input.is_key_pressed(KEY_F11):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			
	if Input.is_key_pressed(KEY_0) or Input.is_key_pressed(KEY_KP_0):
		Global.dialogue_start = "start"
		reload_scene()
	elif Input.is_key_pressed(KEY_1) or Input.is_key_pressed(KEY_KP_1):
		Global.dialogue_start = "scenes"
		reload_scene()
	elif Input.is_key_pressed(KEY_2) or Input.is_key_pressed(KEY_KP_2):
		Global.dialogue_start = "nodes"
		reload_scene()
	elif Input.is_key_pressed(KEY_3) or Input.is_key_pressed(KEY_KP_3):
		Global.dialogue_start = "hamster"
		reload_scene()
	elif Input.is_key_pressed(KEY_4) or Input.is_key_pressed(KEY_KP_4):
		Global.dialogue_start = "chess"
		reload_scene()
	elif Input.is_key_pressed(KEY_5) or Input.is_key_pressed(KEY_KP_5):
		Global.dialogue_start = "ski"
		reload_scene()
	elif Input.is_key_pressed(KEY_6) or Input.is_key_pressed(KEY_KP_6):
		Global.dialogue_start = "conclusion"
		reload_scene()
