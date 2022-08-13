extends Spatial

const NODE_NAME_PLAYER = "Player"
const NODE_NAME_UI = "UI"

func _ready():
	
	# init default values
	$UI.setScore(0)
	# add one coin
	$UI.addCoin($Coins.get_child_count())


func _on_CoinHitSingal():
	# chagne score
	$UI.removeCoin(1)
	$UI.changeScore(1)
