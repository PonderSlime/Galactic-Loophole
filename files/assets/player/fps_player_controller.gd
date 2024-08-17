extends CharacterBody3D

@export var gravity = 9.8
var speed = 5
var jump_speed = 7
var mouse_sensitivity = 0.002
@export var cam : Camera3D
#@onready var state_machine = $AnimationTree["parameters/playback"]
var grav : bool = false
var flip : bool = false
func _ready() -> void:
	add_to_group("player")	
func _physics_process(delta):
	if Input.is_action_just_pressed("grav_swap"):
		grav = !grav
		gravity = -gravity
		jump_speed = -jump_speed
		flip = true
			
	if grav and flip == true:
			rotation_degrees.z += 1
			if rotation_degrees.z == 180:
				flip = false
				rotation_degrees.z = 180
			print(rotation_degrees.z)
	elif !grav and flip == true:
			rotation_degrees.z -= 1
			if rotation_degrees.z == 0:
				flip = false
				rotation_degrees.z = 0
	velocity.y += -gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed

	move_and_slide()
	if (is_on_floor() or is_on_ceiling()) and Input.is_action_just_pressed("jump"):
		velocity.y += jump_speed
func _input(event):
		
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_object_local(Vector3(0, 1, 0),-event.relative.x * mouse_sensitivity)
		cam.rotate_object_local(Vector3(1, 0, 0), -event.relative.y * mouse_sensitivity)
		cam.rotation.x = clampf(cam.rotation.x, -deg_to_rad(70), deg_to_rad(70))
