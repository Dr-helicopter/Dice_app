extends CheckButton
class_name DiceControl


export var _dice : String
var dice : Dice
onready var Dices = $"../../../../../../../dices"

func _ready():
	dice = Dices.get_node(_dice)

func _on_button_toggled(button_pressed):
	if button_pressed:
		
		Dices.add_child(dice)
	else:
		Dices.remove_child(dice)

