extends KinematicBody

var playerName = "Susan"

enum JumpState {
	Start = 0,
	Jumping,
	Idel
}

# speed
var velocity = Vector3(0, 0, 0);
var jumpState = JumpState.Idel;
const JUMP_START_VELOCITY = 10;
var G = 9.8;

const SPEED = 5;
const SPEED_ROLL = 5;

# scene nodes
const NODE_NAME_UI = "UI"

var uiNode;

func _ready():
	print("Player " + playerName + " is ready")
	print("Speed " + str(velocity))
	
	uiNode = get_parent().find_node(NODE_NAME_UI)
	# init default value
	uiNode.setLife(true)
	
# input event
func _input(event):
	if (event.device == KEY_W):
		print (event)
		
# jump start with a velocity, and slow down with gravity	
# will change the velocity.y
func _jump_process(delta):
	if Input.is_action_just_pressed('ui_jump') and jumpState == JumpState.Idel:
		jumpState = JumpState.Start;

	if jumpState == JumpState.Start:
		velocity.y = JUMP_START_VELOCITY
		jumpState = JumpState.Jumping;
	elif jumpState == JumpState.Jumping:
		velocity.y -= G * delta;
	
	# if on the ground, finish jumping
	var flag = is_on_floor()
	if (velocity.y <  -2 *JUMP_START_VELOCITY):
		velocity.y = 0
		jumpState = JumpState.Idel;

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
	

	_jump_process(delta);
		
		
	move_and_slide(velocity, Vector3(0, -1, 0));

func _on_Enemy_body_entered(body):
	print ("hit somebody " + body.name)
	if body.name == "Player":
		print ("hit enemy ，game over " + body.name)
		get_tree().change_scene("res://GameOver.tscn")
	
