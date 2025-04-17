extends Node2D




## bananas
@onready var banane_00: Marker2D = $banane/banane_00
@onready var banane_01: Marker2D = $banane/banane_01
@onready var banane_02: Marker2D = $banane/banane_02
@onready var banane_03: Marker2D = $banane/banane_03
@onready var banane_04: Marker2D = $banane/banane_04
@onready var banane_05: Marker2D = $banane/banane_05
@onready var banane_06: Marker2D = $banane/banane_06
@onready var banane_07: Marker2D = $banane/banane_07
@onready var banane_08: Marker2D = $banane/banane_08
@onready var banane_09: Marker2D = $banane/banane_09
@onready var banane_10: Marker2D = $banane/banane_10
@onready var banane_11: Marker2D = $banane/banane_11
@onready var banane_12: Marker2D = $banane/banane_12
@onready var banane_13: Marker2D = $banane/banane_13
@onready var banane_14: Marker2D = $banane/banane_14



## oranges

@onready var orange_00: Marker2D = $orange/orange_00
@onready var orange_01: Marker2D = $orange/orange_01
@onready var orange_02: Marker2D = $orange/orange_02
@onready var orange_03: Marker2D = $orange/orange_03
@onready var orange_04: Marker2D = $orange/orange_04
@onready var orange_05: Marker2D = $orange/orange_05
@onready var orange_06: Marker2D = $orange/orange_06
@onready var orange_07: Marker2D = $orange/orange_07
@onready var orange_08: Marker2D = $orange/orange_08
@onready var orange_09: Marker2D = $orange/orange_09
@onready var orange_10: Marker2D = $orange/orange_10
@onready var orange_11: Marker2D = $orange/orange_11
@onready var orange_12: Marker2D = $orange/orange_12
@onready var orange_13: Marker2D = $orange/orange_13
@onready var orange_14: Marker2D = $orange/orange_14



@onready var timer_sequenceur: Timer = $timer_sequenceur





var orange_array = []
var banana_array = []



var jaune_index = 0
var orange_index = 0

var time_index = 0

var time_checking = false

var spawn_index = 0

var repertoire_temps = {
	"couleur" : [],
	"fiche" : [],
	"temps" : []
}


func _ready() -> void:
	create_arrays()
	timer_sequenceur.wait_time = 1
	timer_sequenceur.start()
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		show()
		play_video()
	


func placer_bonhomme(couleur: String, fiche: Array):
	repertoire_temps["couleur"].append(couleur)
	repertoire_temps["fiche"].append(fiche)
	repertoire_temps["temps"].append(time_index)
	print(repertoire_temps)
		
	
	
func reproduire_video():
	var fiche = repertoire_temps["fiche"]
	var couleur = repertoire_temps["couleur"]
	
	if couleur[spawn_index] == "jaune":
		print("JAUNE DETECTED")
		var spot_fruit = banana_array[jaune_index]
		var fruit = spot_fruit.get_child(0)
		fruit.remake_bonhomme(fiche[spawn_index])
		jaune_index += 1
	if couleur[spawn_index] == "orange":
		print("ORANGE DETECTED")
		var spot_fruit = orange_array[orange_index]
		
		var fruit = spot_fruit.get_child(0)
		fruit.remake_bonhomme(fiche[spawn_index])
		orange_index += 1
		
	
	
	
	
	spawn_index += 1
		
func create_arrays():
	var temp_banana = [banane_00, banane_01, banane_02, banane_03, banane_04, banane_05, banane_06, banane_07,
	banane_08, banane_09, banane_10, banane_11, banane_12, banane_13, banane_14]
	banana_array.append_array(temp_banana)
	
	var temp_orange = [orange_00, orange_01, orange_02, orange_03, orange_04, orange_05, orange_06, orange_07,
	orange_08, orange_09, orange_10, orange_11, orange_12, orange_13, orange_14]
	orange_array.append_array(temp_orange)


func _on_timer_sequenceur_timeout() -> void:
	time_index += 1
	
	if time_checking == true:	
		if repertoire_temps["temps"].has(time_index):
			reproduire_video()
	if time_index < 120:
		timer_sequenceur.wait_time = 1
		timer_sequenceur.start()

func play_video():
	show()
	time_checking = true
	time_index = 0
	timer_sequenceur.wait_time = 1
	timer_sequenceur.start()
	
