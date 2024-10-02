extends AnimatedSprite2D

@onready var state = $"../StateMachine"

func _ready():
	play_animation()


func _process(_delta):
	play_animation()


func play_animation():
	match state.state:
		state.States.WALKING:
			match state.direction:
				Utils.Direction.RIGHT:
					play("walk_right")
				Utils.Direction.LEFT:
					play("walk_left")
				Utils.Direction.DOWN:
					play("walk_down")
				Utils.Direction.UP:
					play("walk_up")
		state.States.IDLE:
			match state.direction:
				Utils.Direction.RIGHT:
					play("idle_right")
				Utils.Direction.LEFT:
					play("idle_left")
				Utils.Direction.DOWN:
					play("idle_down")
				Utils.Direction.UP:
					play("idle_up")
