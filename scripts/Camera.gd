extends Camera

signal moving()

export var factor : float
var target_position : float
var pointA : Vector3 = Vector3(2, 0 , 0)
var pointB : Vector3 = Vector3(-2, 0 , 0)

onready var divar_r : CollisionShape  = $"../divar ha/divar_E_rast"
onready var divar_l : CollisionShape  = $"../divar ha/divar_E_chap"
onready var divar_u : CollisionShape  = $"../divar ha/divar_E_bala"
onready var divar_d : CollisionShape  = $"../divar ha/divar_E_pain"



func _ready():
	target_position = translation.y

func _process(_delta):
	translation.y = lerp(translation.y, target_position , 0.3)
	if abs(translation.y - target_position) > 0.01:
		emit_signal("moving")

func resize(middle : Vector2) -> float:
	var pap : Vector2 = unproject_position(pointA)
	var pbp : Vector2 = unproject_position(pointB)
	var MtPx : float  = (pap.y - pbp.y) / 4
	divar_u.translation.x = - middle.y / MtPx
	divar_d.translation.x = middle.y / MtPx
	divar_r.translation.z = middle.x / MtPx
	divar_l.translation.z = - middle.x / MtPx
	return MtPx

func zoom(change : float):
	target_position -= change * factor
	target_position = clamp(target_position , 4 , 11)
