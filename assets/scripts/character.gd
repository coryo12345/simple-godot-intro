extends CharacterBody2D

@export var speed = 50.0

@onready var sprite = $AnimatedSprite2D

@onready var previous_velocity = Vector2()

func _physics_process(_delta):
	
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	velocity.y = Input.get_axis("ui_up", "ui_down") * speed

	if velocity.x > 0:
		sprite.play("walk_right")
	elif velocity.x < 0:
		sprite.play("walk_left")
	elif velocity.y > 0:
		sprite.play("walk_down")
	elif velocity.y < 0:
		sprite.play("walk_up")
	elif previous_velocity.x > 0:
		sprite.play("idle_right")
	elif previous_velocity.x < 0:
		sprite.play("idle_left")
	elif previous_velocity.y > 0:
		sprite.play("idle_down")
	elif previous_velocity.y < 0:
		sprite.play("idle_up")
		
	

	if velocity.x != previous_velocity.x || velocity.y != previous_velocity.y:
		previous_velocity.x = velocity.x
		previous_velocity.y = velocity.y
		print(previous_velocity)

	move_and_slide()
