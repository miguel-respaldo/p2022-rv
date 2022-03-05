extends KinematicBody


# Declare member variables here. Examples:
export var h_sensibilidad = 0.0005
export var v_sensibilidad = 0.001

export var velocidad = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y( -event.relative.x * h_sensibilidad )
		$Camera.rotate_x( -event.relative.y * v_sensibilidad )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel_actual = Vector3(0, 0, 0)

	# Velocidad hacia adelante y atras
	if Input.is_action_pressed("ui_up"):
		vel_actual.z -= velocidad
	if Input.is_action_pressed("ui_down"):
		vel_actual.z += velocidad

	# Velocidad hacia izuierda y derecha
	if Input.is_action_pressed("ui_left"):
		vel_actual.x -= velocidad
	if Input.is_action_pressed("ui_right"):
		vel_actual.x += velocidad

	vel_actual = vel_actual.rotated( Vector3(0, 1, 0), rotation.y)

	# Esta linea se encarga de movernos
	move_and_slide( vel_actual )
