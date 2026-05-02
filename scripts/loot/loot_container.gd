extends Node3D
class_name LootContainer

@export var loot_items: Array[Dictionary] = [
	{"name": "Ammo 5.45x39", "rarity": "common", "value": 50},
	{"name": "Medical Kit", "rarity": "uncommon", "value": 200},
	{"name": "Graphics Card", "rarity": "rare", "value": 500},
	{"name": "Weapon Mod", "rarity": "uncommon", "value": 150},
	{"name": "Dogtag", "rarity": "epic", "value": 750},
	{"name": "Quest Item", "rarity": "common", "value": 100},
]

@export var loot_count: int = 3
@export var loot_range: float = 5.0

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

var is_looted: bool = false
var current_loot: Array = []

func _ready():
	if mesh_instance == null:
		mesh_instance = MeshInstance3D.new()
		add_child(mesh_instance)
		mesh_instance.name = "MeshInstance3D"
	
	if mesh_instance.mesh == null:
		mesh_instance.mesh = BoxMesh.new()
		mesh_instance.mesh.size = Vector3(0.5, 0.5, 0.5)
	
	if collision_shape == null:
		collision_shape = CollisionShape3D.new()
		add_child(collision_shape)
		collision_shape.name = "CollisionShape3D"
	
	if collision_shape.shape == null:
		collision_shape.shape = BoxShape3D.new()
		collision_shape.shape.size = Vector3(0.5, 0.5, 0.5)
	
	# Generate random loot on spawn
	generate_loot()

func generate_loot():
	current_loot.clear()
	for i in range(loot_count):
		if loot_items.size() > 0:
			var random_item = loot_items[randi() % loot_items.size()]
			current_loot.append(random_item.duplicate())

func get_loot() -> Array:
	if not is_looted:
		is_looted = true
		mesh_instance.modulate = Color.DARK_GRAY
		print("Container looted: ", current_loot)
		return current_loot.duplicate()
	return []

func reset_loot():
	is_looted = false
	generate_loot()
	mesh_instance.modulate = Color.WHITE

func is_nearby(player_pos: Vector3) -> bool:
	return global_position.distance_to(player_pos) < loot_range
