extends Area

const NODE_NAME_PLAYER = "Player"
const NODE_NAME_LEVEL = "Level"
const NODE_NAME_UI = "UI"

var playerNode;
var uiNode;

func _ready():
	var levelNode = find_parent(NODE_NAME_LEVEL)
	playerNode = levelNode.find_node(NODE_NAME_PLAYER)
	uiNode = levelNode.find_node(NODE_NAME_UI)

	# add one coin
	uiNode.addCoin(1)

func _exit_tree():
	print ("coin remove ")

func _on_Coin_body_entered(body):
	print ("hit coin " + body.name)
	if (body.name == playerNode.name):
		print ("hit coin by player")
		# rmeove one coin
		uiNode.removeCoin(1)
		# add one score
		uiNode.changeScore(1)
		
		get_parent().remove_child(self)
