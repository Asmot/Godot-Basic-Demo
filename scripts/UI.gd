extends Control

var leftCoinNUm = 0;
var scoreNUm = 0;

func _ready():
	pass
	
func checkGameStae():
	if (leftCoinNUm == 0) :
		get_tree().change_scene("res://YouWin.tscn")

func setScore(score):
	$LabelScoreValue.text = "%s"%(score);

func setLife(flag : bool):
	if flag:
		$LabelLifeValue.text = "1"
	else:
		$LabelLifeValue.text = "0"


func setLeftCoins(num):
	$LabelCoinsValue.text = "%s"%(num);

func addCoin(num):
	leftCoinNUm = leftCoinNUm + num;
	setLeftCoins(leftCoinNUm);

func removeCoin(num):
	leftCoinNUm = leftCoinNUm - num;
	setLeftCoins(leftCoinNUm);
	
	checkGameStae();
	
func changeScore(num):
	scoreNUm = scoreNUm + num
	setScore(scoreNUm)
