extends Control

func _ready():
# warning-ignore:unused_variable
	var score_changed = Global.connect("score_changed",self,"_on_score_changed")
# warning-ignore:unused_variable
	var time_changed = Global.connect("time_changed",self,"_on_time_changed")
# warning-ignore:unused_variable
	var bonus_changed = Global.connect("bonus_changed",self,"_on_bonus_changed")
	_on_score_changed()
	_on_time_changed()
	_on_bonus_changed()
	$Instructions.show()
	get_tree().paused = true

func _on_score_changed():
	$Score.text = "Score: " + str(Global.score)

func _on_time_changed():
	$Time.text = "Time:  " + str(Global.time)

func _on_bonus_changed():
	var ch = $Bonus.get_children()
	for c in ch:
		if c.name == "Bonus":
			c.queue_free()
	if Global.Bonus != null:
		var bonus = Global.Bonus.instance()
		bonus.position = Vector2(288,100)
		bonus.name = "Bonus"
		$Bonus.add_child(bonus)

func _on_Timer_timeout():
	Global.change_time()
