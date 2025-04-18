extends Node2D

@onready var croco_panel: Node2D = $croco_panel
@onready var skippy_timer: Timer = $skippy_timer



var jeu_scene = preload("res://jeu.tscn")

var can_skip = false

var message_index = 0

func _ready() -> void:
	can_skip = false
	var replique = ""
	if JohnSingleton.francais == true:
		replique = "On a un gros problème, donc j'ai besoin de toi!"
	elif JohnSingleton.francais == false:
		replique = "We have a big problem, so i need your help!"
	croco_panel.croco_parle(replique, "normal")


func _physics_process(delta: float) -> void:
	if Input.is_anything_pressed():
		if can_skip == true:
			message_index += 1
			if message_index > 6:
				get_tree().change_scene_to_packed(jeu_scene)
			else:
				next_message()


func _on_skippy_timer_timeout() -> void:
	print("can skip")
	can_skip = true
	
func next_message():
	var replique = ""
	can_skip = false
	skippy_timer.wait_time = 1
	skippy_timer.start()
	match message_index:
		1:
			if JohnSingleton.francais == true:
				replique = "On a invité tous les fans du beatboxer Bobo à participer à un clip vidéo..."
			elif JohnSingleton.francais == false:
				replique = "We invited all the fans of the beatboxer Bobo to feature in a music video..."
			croco_panel.croco_parle(replique, "normal")
		2:
			if JohnSingleton.francais == true:
				replique = "C'est le chaos total, car les fans de Bobo sont trop nombreux!"
			elif JohnSingleton.francais == false:
				replique = "It's a total chaos, because there are too much Bobo's fans!"
			croco_panel.croco_parle(replique, "normal")
		3:
			if JohnSingleton.francais == true:
				replique = "Trouve-moi 10 fans habillés en orange et 10 autres fans habillés en jaune."
			elif JohnSingleton.francais == false:
				replique = "Find me 10 fans dressed in orange and 10 other fans dressed in yellow."
			croco_panel.croco_parle(replique, "normal")
		4:
			if JohnSingleton.francais == true:
				replique = "Mais attention, pas d'alcool, pas de fumée et pas de flingues!"
			elif JohnSingleton.francais == false:
				replique = "But be careful, no alcohol, no smoking and no guns!"
			croco_panel.croco_parle(replique, "normal")
		5:
			if JohnSingleton.francais == true:
				replique = "À trois erreurs, tu es viré!"
			elif JohnSingleton.francais == false:
				replique = "Three mistakes and you're fired!"
			croco_panel.croco_parle(replique, "normal")
		6:
			if JohnSingleton.francais == true:
				replique = "Le tournage du clip est déjà commencé, alors bonne chance!"
			elif JohnSingleton.francais == false:
				replique = "The filming of the clip has already started! Let's go and good luck!"
			croco_panel.croco_parle(replique, "normal")
