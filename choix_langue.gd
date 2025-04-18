extends Control


var menu_scene = preload("res://menu_titre.tscn")
@onready var startsound: AudioStreamPlayer = $startsound

func _ready() -> void:
	pass


func _on_bouton_fr_pressed() -> void:
	JohnSingleton.francais = true
	ready_to_go()


func _on_bouton_en_pressed() -> void:
	JohnSingleton.francais = false
	ready_to_go()


func ready_to_go():
	startsound.play()


func _on_startsound_finished() -> void:
	get_tree().change_scene_to_packed(menu_scene)
