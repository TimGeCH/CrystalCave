extends CanvasLayer

onready var MP_Lable = $HBoxContainer/Label

var total_MincePie = 1

func _ready():
	Globals.connect("MincePie_changed", self, "_on_MincePie_changed") # 修改这里
	update_label_text(Globals.get_MincePie())

func _on_MincePie_changed():
	update_label_text(Globals.get_MincePie())

func update_label_text(collected_MincePie):
	MP_Lable.text = str(collected_MincePie) + "/" + str(total_MincePie)
