extends RigidBody3D

@export var move_speed : float = 5.0
@export var fall_threshold : float = -8.0

func _physics_process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_LEFT):
		linear_velocity.x = -move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		linear_velocity.x = move_speed
		
	if position.y < fall_threshold:
		call_deferred("reload_scene")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Tree"):
		call_deferred("reload_scene")        

func reload_scene():
	var new_basis = Basis()
	new_basis = new_basis.rotated(Vector3(1, 0, 0), deg_to_rad(-20))
	new_basis = new_basis.rotated(Vector3(0, 1, 0), deg_to_rad(0))
	new_basis = new_basis.rotated(Vector3(0, 0, 1), deg_to_rad(0)) 
	transform.basis = new_basis

	position.y = 5.802
	position.x = 0
	position.z = 12.184
	
	inertia = Vector3.ZERO
	constant_force = Vector3.ZERO
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
