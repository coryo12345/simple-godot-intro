extends Control

const ROTATION_FACTOR = 0.1

func _ready():
    self.pivot_offset = self.size / 2
    mouse_entered.connect(rotate.bind(-ROTATION_FACTOR))
    mouse_exited.connect(rotate.bind(ROTATION_FACTOR))


func rotate(deg):
    self.rotation += deg