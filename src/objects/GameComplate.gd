extends Control

onready var death_value =$UI/Stars/DeathsValue
onready var coin_value = $UI/Stars/CoinValue


func _ready():
	death_value.text = str(Globals.deaths)
	coin_value.text = str(Globals.get_coins())

func _input(event):
	if event.is_pressed():
		Globals.back_to_menu()
