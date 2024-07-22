extends Control


export var menu_size : float = 0.1
export var speed_lerp : float = 0.2


var popedup : bool = false
var _up_anchor : int 
var _down_anchor : int 
var _target_anchor : int



func _ready():
	_up_anchor = int(get_rect().position.y)
	_down_anchor = int(_up_anchor + get_rect().size.y)
	_target_anchor = _down_anchor

func _process(_delta):
	rect_position.y = lerp(rect_position.y, _target_anchor, speed_lerp)


func _unhandled_input(event):
	if event is InputEventSingleScreenSwipe:
		if event.relative.y > 0:
			close()
		else:
			oppen()

func _on_TextureButton_pressed():
	if ! popedup:
		oppen()
	else:
		close()


func oppen():
	_target_anchor = _up_anchor
	popedup = true

func close():
	_target_anchor = _down_anchor
	popedup = false
