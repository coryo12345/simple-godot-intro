extends CharacterBody2D

@export var speed = 100.0

@onready var sprite = $AnimatedSprite2D
@onready var state = $StateMachine
@onready var inv: Inventory = $Inventory


func _physics_process(_delta):
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	velocity.y = Input.get_axis("move_up", "move_down") * speed

	state.update_state(velocity)	
	move_and_slide()


func toggle_character_inventory():
	inv.toggle_inventory_ui()