extends TextureRect

@export var hidden_position: Vector2
@export var visible_position: Vector2
@export var transition_duration: float = 0.5

var texture_paths = [
	"res://ressources/figures/figure_0_scene_tree.png",
	"res://ressources/figures/figure_1_balloon_tree.png",
	"res://ressources/figures/figure_2_no_node.png",
	"res://ressources/figures/figure_3_code_seed.png",
	"res://ressources/figures/figure_4_tree_seed.png",
	"res://ressources/figures/figure_5_code_hamster.png",
	"res://ressources/figures/figure_6_prog_tree.png",
	"res://ressources/figures/figure_7_tree_queen.png",
	"res://ressources/figures/figure_8_code_queen.png",
	"res://ressources/figures/figure_9_code_ski.png"
]

var tween

func move_panel(target_position: Vector2) -> void:
	if tween:
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(self, "position", target_position, transition_duration)

func move_visible() -> void:
	move_panel(visible_position)
	
func move_hidden() -> void:
	move_panel(hidden_position)

func change_texture(texture_id: int) -> void:
	if texture_id >= 0 and texture_id < texture_paths.size():
		var texture_rect = get_child(0)
		if texture_rect and texture_rect is TextureRect:
			texture_rect.texture = load(texture_paths[texture_id])
	else:
		print("Texture ID invalide : ", texture_id)
