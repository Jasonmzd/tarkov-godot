extends CharacterBody3D
class_name Player

# Movement
@export var move_speed: float = 7.0
@export var sprint_speed: float = 12.0
@export var acceleration: float = 20.0
@export var friction: float = 15.0

# Camera
@onready var camera: Camera3D = $Camera3D
var mouse_sensitivity: float = 0.003
var camera_x_rotation: float = 0.0

# State
var is_sprinting: bool = false
var is_jumping: bool = false
@export var jump_power: float = 8.0

# Inventory
var inventory_manager: InventoryManager

func _ready():
	inventory_manager = InventoryManager.new()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Handle input
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Sprint
	is_sprinting = Input.is_action_pressed("ui_select")
	var current_speed = sprint_speed if is_sprinting else move_speed
	
	# Move
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = lerp(velocity.x, direction.x * current_speed, acceleration * delta)
	velocity.z = lerp(velocity.z, direction.z * current_speed, acceleration * delta)
	
	# Gravity
	velocity.y -= 9.8 * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_power
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera_x_rotation -= event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation, -PI/2, PI/2)
		camera.rotation.x = camera_x_rotation
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func add_item(item: Dictionary) -> bool:
	return inventory_manager.add_item(item)

func get_inventory() -> Array:
	return inventory_manager.get_items()
