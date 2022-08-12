extends KinematicBody

var playerName = "Susan"

# speed
var velocity = Vector3(0, 0, 0);
const SPEED = 5;
const SPEED_ROLL = 5;

const GRAVITY = 1000;

func _ready():
	print("Player " + playerName + " is ready")
	print("Speed " + str(velocity))

# input event
func _input(event):
	if (event.device == KEY_W):
		print (event)

func _physics_process(delta):
	
#	if Input.is_action_pressed("ui_up"):
#		print ("up pressed")
#		velocity.z += 1
#	if Input.is_action_pressed("ui_down"):
#		print ("down pressed")
#		velocity.z += -1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x = 1
#	if Input.is_action_pressed("ui_right"):
#		velocity.x = -1
	
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(SPEED_ROLL))
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-SPEED_ROLL))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-SPEED_ROLL))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(SPEED_ROLL))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	
	move_and_slide(velocity);
	
