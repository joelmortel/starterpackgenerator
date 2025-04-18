extends Node

var francais = false

var wingame = false


signal clipvideo

signal jeufini

func clip_video():
	emit_signal("clipvideo")
	
func jeu_fini():
	emit_signal("jeufini")
