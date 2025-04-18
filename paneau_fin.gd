extends Node2D

@onready var croco_panel: Node2D = $croco_panel
@onready var skippy_timer: Timer = $skippy_timer

var menu_scene = load("res://menu_titre.tscn")

var can_skip = false

var message_index = 0

var end_game = false

func _ready() -> void:
	hide()
	can_skip = false
	JohnSingleton.connect("jeufini", end_clip_message)


func _physics_process(delta: float) -> void:
	if Input.is_anything_pressed():
		if can_skip == true:
			if end_game == true:
				get_tree().change_scene_to_packed(menu_scene)
			else:
				message_index += 1
				win_message()
			


func _on_skippy_timer_timeout() -> void:
	print("can skip")
	can_skip = true
	
func game_over_message():
	show()
	var replique = ""
	can_skip = false
	skippy_timer.wait_time = 1
	skippy_timer.start()
	
	
	if JohnSingleton.francais == true:
		replique = "Tu as merdé ton coup mec. Tu es viré."
	elif JohnSingleton.francais == false:
		replique = "You messed up, man. You're fired."
	croco_panel.croco_parle(replique, "normal")
	end_game = true
	
func win_message():
	show()
	var replique = ""
	can_skip = false
	if message_index < 2:
		skippy_timer.wait_time = 1
		skippy_timer.start()


	match message_index:
		0:
			if JohnSingleton.francais == true:
				replique = "Génial! Le clip vidéo est un succès grâce à tes figurants!"
			elif JohnSingleton.francais == false:
				replique = "Great! The music video is a success thanks to your extras!"
			croco_panel.croco_parle(replique, "normal")
		1:
			if JohnSingleton.francais == true:
				replique = "Maintenant, voici le résultat final! Ça sera un gros succès!!!"
			elif JohnSingleton.francais == false:
				replique = "Now here is the final result! It will be a big hit!!!"
			croco_panel.croco_parle(replique, "normal")
		2:
			can_skip = false
			hide()
			JohnSingleton.clip_video()
		
func end_clip_message():
	show()
	var replique = ""
	can_skip = false
	skippy_timer.wait_time = 1
	skippy_timer.start()
	if JohnSingleton.francais == true:
		replique = "Bon boulot! Je vais suggérer ton nom à tous mes contacts!"
	elif JohnSingleton.francais == false:
		replique = "Great job! I'll suggest your name to all my contacts!"
	croco_panel.croco_parle(replique, "normal")
	end_game = true
