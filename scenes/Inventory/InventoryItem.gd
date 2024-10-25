extends Node
class_name InventoryItem

@export var item_name: String = ""
@export var id: String = ""
@export var inventory_sprite: Resource

func _init(_id, _name, _sprite):
    self.item_name = _name
    self.id = _id
    self.inventory_sprite = _sprite
