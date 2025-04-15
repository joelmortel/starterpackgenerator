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
@onready var banane_15: Marker2D = $banane/banane_15
@onready var banane_16: Marker2D = $banane/banane_16
@onready var banane_17: Marker2D = $banane/banane_17
@onready var banane_18: Marker2D = $banane/banane_18
@onready var banane_19: Marker2D = $banane/banane_19
@onready var banane_20: Marker2D = $banane/banane_20
@onready var banane_21: Marker2D = $banane/banane_21
@onready var banane_22: Marker2D = $banane/banane_22
@onready var banane_23: Marker2D = $banane/banane_23
@onready var banane_24: Marker2D = $banane/banane_24


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
@onready var orange_15: Marker2D = $orange/orange_15
@onready var orange_16: Marker2D = $orange/orange_16
@onready var orange_17: Marker2D = $orange/orange_17
@onready var orange_18: Marker2D = $orange/orange_18
@onready var orange_19: Marker2D = $orange/orange_19
@onready var orange_20: Marker2D = $orange/orange_20
@onready var orange_21: Marker2D = $orange/orange_21
@onready var orange_22: Marker2D = $orange/orange_22
@onready var orange_23: Marker2D = $orange/orange_23
@onready var orange_24: Marker2D = $orange/orange_24


var orange_array = []
var banana_array = []



var jaune_index = 0
var orange_index = 0


func _ready() -> void:
	create_arrays()



func placer_bonhomme(couleur: String, fiche: Array):
	if couleur == "jaune":
		var spot_fruit = banana_array[jaune_index]
		var fruit = spot_fruit.get_child(0)
		fruit.remake_bonhomme(fiche)
		jaune_index += 1
	if couleur == "orange":
		var spot_fruit = orange_array[orange_index]
		var fruit = spot_fruit.get_child(0)
		fruit.remake_bonhomme(fiche)
		orange_index += 1
		
func create_arrays():
	var temp_banana = [banane_00, banane_01, banane_02, banane_03, banane_04, banane_05, banane_06, banane_07,
	banane_08, banane_09, banane_10, banane_11, banane_12, banane_13, banane_14, banane_15, banane_16, banane_17,
	banane_18, banane_19, banane_20, banane_21, banane_22, banane_23, banane_24]
	banana_array.append_array(temp_banana)
	
	var temp_orange = [orange_00, orange_01, orange_02, orange_03, orange_04, orange_05, orange_06, orange_07,
	orange_08, orange_09, orange_10, orange_11, orange_12, orange_13, orange_14, orange_15, orange_16, orange_17,
	orange_18, orange_19, orange_20, orange_21, orange_22, orange_23, orange_24]
	orange_array.append_array(temp_orange)
