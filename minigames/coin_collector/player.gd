extends CharacterBody2D

var move_speed : float = 200.0
var animated_sprite : AnimatedSprite2D
var shrink_timer : Timer

func _ready() -> void:
	animated_sprite = get_node("AnimatedSprite2D")
	
	# Création et configuration du Timer
	shrink_timer = Timer.new()
	shrink_timer.wait_time = 1.0  # Réduction toutes les secondes
	shrink_timer.one_shot = false
	shrink_timer.connect("timeout", Callable(self, "_shrink_player"))
	add_child(shrink_timer)
	shrink_timer.start()

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
	velocity = velocity.normalized() * move_speed
	move_and_slide()

	update_animation()

func update_animation() -> void:
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("right")
			else:
				animated_sprite.play("left")
		else:
			if velocity.y > 0:
				animated_sprite.play("down")
			else:
				animated_sprite.play("up")
	else:
		animated_sprite.frame = 1

# Fonction appelée toutes les secondes pour réduire la taille du player
func _shrink_player() -> void:
	if scale.x > 0.5:  # Empêcher la taille de devenir trop petite
		scale.x -= 0.025
		scale.y -= 0.025
