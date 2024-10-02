extends Node

enum States {IDLE,WALKING}

var state: States = States.IDLE
var direction: Utils.Direction = Utils.Direction.DOWN

func update_state(velocity: Vector2):
    if velocity.length() != 0:
        state = States.WALKING
    else:
        state = States.IDLE

    if velocity.x > 0:
        direction = Utils.Direction.RIGHT
    elif velocity.x < 0:
        direction = Utils.Direction.LEFT
    elif velocity.y > 0:
        direction = Utils.Direction.DOWN
    elif velocity.y < 0:
        direction = Utils.Direction.UP
