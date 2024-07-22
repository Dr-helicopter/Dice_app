extends RigidBody
class_name Dice


var factor : float = 0.4


var rng : RandomNumberGenerator = RandomNumberGenerator.new()


func _ready():
	get_parent().connect("toss", self, "toss")




func toss(pos : Vector3):
	var relet: Vector3 = Vector3(translation.x - pos.x,  0, translation.z - pos.z)
	linear_velocity.x = (relet.x) * factor
	linear_velocity.z = (relet.z) * factor
	linear_velocity.y = 5
	apply_torque_impulse(relet.normalized().rotated(Vector3.UP, -90) * 2)
