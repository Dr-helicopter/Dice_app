extends Node

signal toss(power)

onready var camera : Camera = $"../Camera"


# dices
onready var coin : Dice = $coin

onready var D4 : Dice = $D4

onready var D6C : Dice = $D6Classic

onready var D6M : Dice = $D6Modern

onready var D8 : Dice = $D8

onready var D10 : Dice = $D10

onready var D12 : Dice = $D12

onready var D20 : Dice = $D20




var MtPx : float
var middle : Vector2


func _ready():
	get_viewport().connect("size_changed", self, "_on_size_changed")
	_on_size_changed()



func _input(event):
	if event is InputEventSingleScreenTap:
		var where : Vector2  = Vector2(event.position - middle)
		var power : Vector3 = Vector3(0 ,-1 , 0)
		power.x = where.y / MtPx
		power.z = - where.x / MtPx
		emit_signal("toss", power)
	elif event is InputEventScreenPinch:
		camera.zoom(event.relative)
		MtPx = camera.resize(middle)

func _on_size_changed():
	middle = get_viewport().size / 2
	MtPx = camera.resize(middle)



func _on_coin_toggled(button_pressed):
	if button_pressed:
		add_child(coin)
	else:
		remove_child(coin)


func _on_D6classic_toggled(button_pressed):
	if button_pressed:
		add_child(D6C)
	else:
		remove_child(D6C)


func _on_D6Modern_toggled(button_pressed):
	if button_pressed:
		add_child(D6M)
	else:
		remove_child(D6M)


func _on_D4_toggled(button_pressed):
	if button_pressed:
		add_child(D4)
	else:
		remove_child(D4)


func _on_D8_toggled(button_pressed):
	if button_pressed:
		add_child(D8)
	else:
		remove_child(D8)


func _on_D10_toggled(button_pressed):
	if button_pressed:
		add_child(D10)
	else:
		remove_child(D10)


func _on_D12_toggled(button_pressed):
	if button_pressed:
		add_child(D12)
	else:
		remove_child(D12)


func _on_D20_toggled(button_pressed):
	if button_pressed:
		add_child(D20)
	else:
		remove_child(D20)


func _on_Camera_moving():
	MtPx = camera.resize(middle)




