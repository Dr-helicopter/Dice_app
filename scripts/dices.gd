extends Node

signal toss(power)

onready var camera : Camera = $"../Camera"

var MtPx : float
var middle : Vector2


func _ready():
	get_viewport().connect("size_changed", self, "_on_size_changed")
	_on_size_changed()



func _input(event):
	if event is InputEventSingleScreenTap:
		var where : Vector2  = Vector2(event.position - middle)
		var power : Vector3
		power.x = where.y / MtPx
		power.z = - where.x / MtPx
		emit_signal("toss", power)
	elif event is InputEventScreenPinch:
		camera.zoom(event.relative)
		MtPx = camera.resize(middle)

func _on_size_changed():
	middle = get_viewport().size / 2
	MtPx = camera.resize(middle)




func _on_Camera_moving():
	MtPx = camera.resize(middle)
