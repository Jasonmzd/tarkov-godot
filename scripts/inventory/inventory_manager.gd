extends Node
class_name InventoryManager

var inventory: Array = []
var max_slots: int = 20

func add_item(item: Dictionary) -> bool:
	if inventory.size() < max_slots:
		inventory.append(item)
		return true
	return false

func remove_item(index: int) -> bool:
	if index >= 0 and index < inventory.size():
		inventory.remove_at(index)
		return true
	return false

func get_items() -> Array:
	return inventory.duplicate()

func clear_inventory():
	inventory.clear()

func get_inventory_size() -> int:
	return inventory.size()

func is_full() -> bool:
	return inventory.size() >= max_slots

func get_item_at(index: int) -> Dictionary:
	if index >= 0 and index < inventory.size():
		return inventory[index]
	return {}
