extends CanvasLayer

onready var BC_Lable = $HBoxContainer/Label
onready var value_label = $Value
# 设置总金币数量
var total_ButterChicken = 1

func set_value(value):
	value_label.text = str(value)

func _ready():
	Globals.connect("ButterChicken_changed", self, "_on_ButterChicken_changed")
	update_label_text(Globals.get_ButterChicken())

func _on_ButterChicken_changed():
	update_label_text(Globals.get_ButterChicken())



func update_label_text(collected_ButterChicken):
	BC_Lable.text = str(collected_ButterChicken) + "/" + str(total_ButterChicken)
