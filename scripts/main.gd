extends Node3D

@onready var player: Player = $Player
@onready var ui_label: Label = $CanvasLayer/Label

var loot_containers: Array = []

func _ready():
	# Find all loot containers in scene
	loot_containers = get_tree().get_nodes_in_group("loot_containers")
	if loot_containers.size() == 0:
		loot_containers = find_children("*", "LootContainer")
	
	print("Found ", loot_containers.size(), " loot containers")

func _process(delta):
	# Update UI
	if player:
		var inv_size = player.inventory_manager.get_inventory_size()
		var inv_full = "FULL" if player.inventory_manager.is_full() else str(inv_size, "/", player.inventory_manager.max_slots)
		ui_label.text = "Inventory: " + inv_full + " | WASD: Move | Shift: Sprint | E: Loot | Esc: Menu"
	
	# Check for nearby containers
	for container in loot_containers:
		if container.is_nearby(player.global_position):
			if Input.is_action_just_pressed("ui_focus_next"):
				var loot = container.get_loot()
				for item in loot:
					if player.add_item(item):
						print("Looted: ", item.get("name", "Unknown"))
					else:
						print("Inventory full! Cannot loot: ", item.get("name", "Unknown"))
