extends Node

enum States {IDLE,WALKING}

var state: States = States.IDLE
var direction: Utils.Direction = Utils.Direction.DOWN
var speed_scale: float = 1.0

func update_state(velocity: Vector2, speed: float):
    if velocity.length() != 0:
        self.state = States.WALKING
        self.speed_scale = speed
    else:
        self.state = States.IDLE
        self.speed_scale = 1.0

    if velocity.x > 0:
        self.direction = Utils.Direction.RIGHT
    elif velocity.x < 0:
        self.direction = Utils.Direction.LEFT
    elif velocity.y > 0:
        self.direction = Utils.Direction.DOWN
    elif velocity.y < 0:
        self.direction = Utils.Direction.UP
