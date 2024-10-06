extends Node
class_name Inventory

var items: Array[InventoryItem]

func _init():
    self.items = []


func _process(_delta):
    if Input.is_action_just_pressed("toggle_inventory"):
        GlobalSignals.open_inventory.emit(self)


func get_items() -> Array[InventoryItem]:
    return self.items


func add_item(item: InventoryItem):
    self.items.append(item)


func remove_item(_item: InventoryItem):
    # TODO
    pass


func toggle_inventory_ui():
    GlobalSignals.open_inventory.emit(self)
