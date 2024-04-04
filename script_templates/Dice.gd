extends RigidBody
class_name Dice


export var factor : float


var rng : RandomNumberGenerator = RandomNumberGenerator.new()


func _ready():
	get_parent().connect("toss", self, "toss")




func toss(pos : Vector3):
	linear_velocity.x = (translation.x - pos.x) * factor
	linear_velocity.z = (translation.z - pos.z) * factor
	linear_velocity.y = 5
	apply_torque_impulse(Vector3.FORWARD)
