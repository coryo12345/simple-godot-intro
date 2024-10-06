extends Control

var current_inv: Inventory

func _ready():
	self.visible = false
	GlobalSignals.open_inventory.connect(toggle_ui)


func toggle_ui(inv: Inventory):
	if !self.visible && inv != null:
		self.current_inv = inv
		self.visible = true
	else:
		self.visible = false
		self.current_inv = null


func close_ui():
	self.toggle_ui(null)

