extends Area2D

@onready var state = $"../StateMachine"

var targets: Array[Area2D] = []

func _physics_process(_delta):
	self.rotate_interact_selector()


func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		self.attempt_interact()


func rotate_interact_selector():
	match state.direction:
		Utils.Direction.DOWN:
			self.rotation_degrees = 0
		Utils.Direction.LEFT:
			self.rotation_degrees = 90
		Utils.Direction.UP:
			self.rotation_degrees = 180
		Utils.Direction.RIGHT:
			self.rotation_degrees = 270


func _on_area_entered(body:Area2D):
	self.targets.append(body)


func _on_area_exited(body:Area2D):
	self.targets.erase(body)


func attempt_interact():
	if len(self.targets) == 0:
		return
	# this could be probably be improved by looking at which direction the character is facing
	# for now just try the first
	var target = self.targets[0]
	if target.has_method("on_character_interact"):
		target.call("on_character_interact")
