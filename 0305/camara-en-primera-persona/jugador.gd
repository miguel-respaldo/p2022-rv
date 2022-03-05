extends KinematicBody


# Declare member variables here. Examples:
export var h_sensibilidad = 0.0005
export var v_sensibilidad = 0.001

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y( -event.relative.x * h_sensibilidad )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
