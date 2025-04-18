extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var start_button: Button = $start_button

var intro_jeu = preload("res://intro.tscn")



func _ready() -> void:
	if JohnSingleton.francais == false:
		start_button.text = "Play"


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(intro_jeu)
