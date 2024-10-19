extends Node2D

const Ballon = preload("res://balloon.tscn")

@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"
@onready var duck : AnimatedSprite2D = %DuckSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ballon: Node = Ballon.instantiate()
	get_tree().current_scene.add_child(ballon)
	ballon.start(dialogue_resource, dialogue_start)
	%DuckSprite.connexions()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
