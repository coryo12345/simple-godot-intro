extends CharacterBody2D

@export var speed = 100.0

@onready var sprite = $AnimatedSprite2D
@onready var state = $StateMachine
@onready var inv: Inventory = $Inventory


func _physics_process(_delta):
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	velocity.y = Input.get_axis("move_up", "move_down") * speed

	var speed_scale: float = 1.0
	if Input.is_action_pressed("sprint"):
		speed_scale = 1.6

	velocity *= speed_scale


	state.update_state(velocity, speed_scale)
	move_and_slide()


func toggle_character_inventory():
	inv.toggle_inventory_ui()
