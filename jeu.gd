extends Node2D

@onready var peau: AnimatedSprite2D = $bonhomme/Corps/peau
@onready var vetements: AnimatedSprite2D = $bonhomme/Corps/vetements
@onready var oreilles: AnimatedSprite2D = $bonhomme/Face/oreilles
@onready var tete: AnimatedSprite2D = $bonhomme/Face/tete
@onready var yeux: AnimatedSprite2D = $bonhomme/Face/yeux
@onready var yeux_couleur: AnimatedSprite2D = $bonhomme/Face/yeux_couleur
@onready var nez: AnimatedSprite2D = $bonhomme/Face/nez
@onready var bouche: AnimatedSprite2D = $bonhomme/Face/bouche
@onready var cheveux: AnimatedSprite2D = $bonhomme/Face/cheveux


@onready var bonhomme: Node2D = $bonhomme
@onready var accessoires_1: AnimatedSprite2D = $bonhomme/Accessoires/accessoires1
@onready var accessoires_2: AnimatedSprite2D = $bonhomme/Accessoires/accessoires2





@onready var timer_game: Timer = $Timer_game

## UI cheap
@onready var label_vies: Label = $UICHEAP/ColorRect/label_vies

@onready var jaune_label: Label = $UICHEAP/ColorRect/jaune_label
@onready var orange_label: Label = $UICHEAP/ColorRect/orange_label
@onready var time_label: Label = $UICHEAP/ColorRect/time_label


## audio
@onready var audio_ok: AudioStreamPlayer = $Audio/audio_ok
@onready var audio_fail: AudioStreamPlayer = $Audio/audio_fail
@onready var audio_zap: AudioStreamPlayer = $Audio/audio_zap
@onready var audio_zap_2: AudioStreamPlayer = $Audio/audio_zap2
@onready var audio_zap_3: AudioStreamPlayer = $Audio/audio_zap3
@onready var audio_ok_2: AudioStreamPlayer = $Audio/audio_ok2
@onready var audio_ok_3: AudioStreamPlayer = $Audio/audio_ok3
@onready var audio_full: AudioStreamPlayer = $Audio/audio_full




var tete_index = 0
var yeux_index = 0
var oreille_index = 0
var nez_index = 0
var bouche_index = 0
var cheveux_index = 0
var vetements_index = 0
var clr_peau_index = 0
var clr_yeux_index = 0
var clr_cheveux_index = 0

## couleurs de peau

var couleur_mauve = Color8(195, 178, 255)
var couleur_bleu = Color8(162, 186, 255)
var couleur_rose = Color8(227, 178, 255)
var couleur_jaune = Color8(255, 243, 146)
var couleur_brun = Color8(121, 65, 0)

## couleurs cheveux

var couleur_orange = Color8(255, 121, 48)
var roserose = Color8(243, 97, 255)
var jaunejaune = Color8(235, 211, 32)
var couleur_vert = Color8(73, 170, 16)
var chatain = Color8(195, 113, 0)

## couleurs yeux

var bleubleu = Color8(65, 65, 255)
var brunbrun = Color8(195, 113, 0)
var vertvert = Color8(113, 243, 65)


## répertoire des accessoires
var accessoire_1_index = 0
var accessoire_2_index = 0

## variables jeu du portier

var vies_joueur = 3

var game_time = 120
var temps_restant = 0

var player_score = 0

var npc_jaunes = 0
var npc_orange = 0

var game_over = false


var repertoire_accessoires = [1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16]
var repertoire_acces_interdit = [2, 3, 9, 10, 16]


func _ready() -> void:
	timer_game.wait_time = 1
	timer_game.start()
	game_time = 120
	bonhomme_random()
	accessoires_1.frame = 0
	accessoires_2.frame = 0
	update_the_ui()
		
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		print("jaune")
		verifier_bonhomme("jaune")
	if Input.is_action_just_pressed("ui_right"):
		print("orange")
		verifier_bonhomme("orange")
	if Input.is_action_just_pressed("ui_up"):
		print("rejet")
		verifier_bonhomme("rejet")
		

func update_the_ui():
	label_vies.text = "Points de vie : " + str(vies_joueur)
	jaune_label.text = str(npc_jaunes) + " sur 25"
	orange_label.text = str(npc_orange) + " sur 25"
	if npc_jaunes >= 25:
		jaune_label.text = "COMPLET"
	if npc_orange >= 25:
		orange_label.text = "COMPLET"
		
	var minute_label = floor(game_time/60)
	var seconde_label = floor(game_time % 60)
	
	time_label.text = "Temps restant : " + str(minute_label) + " : " + str(seconde_label)



func set_face():
## régler la forme de la tête
	if tete_index == 9:
		tete_index = 0
	if tete_index == -1:
		tete_index = 8
	tete.frame = tete_index
## régler la forme des yeux
	if yeux_index == 9:
		yeux_index = 0
	if yeux_index == -1:
		yeux_index = 8
	yeux.frame = yeux_index
## régler les oreilles
	if oreille_index == 9:
		oreille_index = 0
	if oreille_index == -1:
		oreille_index = 8
	oreilles.frame = oreille_index
## régler le nez
	if nez_index == 9:
		nez_index = 0
	if nez_index == -1:
		nez_index = 8
	nez.frame = nez_index
## régler la bouche
	if bouche_index == 9:
		bouche_index = 0
	if bouche_index == -1:
		bouche_index = 8
	bouche.frame = bouche_index
## régler les cheveux
	if cheveux_index == 26:
		cheveux_index = 0
	if cheveux_index == -1:
		cheveux_index = 25
	cheveux.frame = cheveux_index
##régler les vêtements
	if vetements_index == 8:
		vetements_index = 0
	if vetements_index == -1:
		vetements_index = 7
	vetements.frame = vetements_index
	
	
## régler la couleur de la peau
	
	if clr_peau_index == 5:
		clr_peau_index = 0
	if clr_peau_index == -1:
		clr_peau_index = 4

	match clr_peau_index:
		0:
			peau.modulate = couleur_mauve
			oreilles.modulate = couleur_mauve
			tete.modulate = couleur_mauve
		1:
			peau.modulate = couleur_bleu
			oreilles.modulate = couleur_bleu
			tete.modulate = couleur_bleu
		2:
			peau.modulate = couleur_rose
			oreilles.modulate = couleur_rose
			tete.modulate = couleur_rose
		3:
			peau.modulate = couleur_jaune
			oreilles.modulate = couleur_jaune
			tete.modulate = couleur_jaune
		4:
			peau.modulate = couleur_brun
			oreilles.modulate = couleur_brun
			tete.modulate = couleur_brun
			
## régler la couleur des yeux
	if clr_yeux_index == 3:
		clr_yeux_index = 0
	if clr_yeux_index == -1:
		clr_yeux_index = 2

	match clr_yeux_index:
		0:
			yeux_couleur.modulate = bleubleu
		1:
			yeux_couleur.modulate = brunbrun
		2: 
			yeux_couleur.modulate = vertvert
			
## régler la couleur des cheveux
	if clr_cheveux_index == 5:
		clr_cheveux_index = 0
	if clr_cheveux_index == -1:
		clr_cheveux_index = 4
	match clr_cheveux_index:
		0:
			cheveux.modulate = couleur_orange
		1:
			cheveux.modulate = roserose
		2:
			cheveux.modulate = jaunejaune
		3:
			cheveux.modulate = couleur_vert
		4:
			cheveux.modulate = chatain
			
## régler accessoires
	accessoires_1.frame = accessoire_1_index
	accessoires_2.frame = accessoire_2_index
		
		
			
	bonhomme.show()
			
			
func bonhomme_random() -> void:
	tete_index = randi_range(0,8)
	yeux_index = randi_range(0,8)
	nez_index = randi_range(0,8)
	bouche_index = randi_range(0,8)
	oreille_index = randi_range(0,8)
	cheveux_index = randi_range(0, 25)
	clr_peau_index = randi_range(0, 4)
	vetements_index = randi_range(0, 7)
	clr_cheveux_index = randi_range(0, 4)
	clr_yeux_index = randi_range(0, 2)
	
	## accessoires randoms
	
	var loto_temporaire = randi_range(0, 100)
	if loto_temporaire > 80:
		var random_acces_1 = repertoire_accessoires.pick_random()
		var random_acces_2 = repertoire_accessoires.pick_random()
		accessoire_1_index = random_acces_1
		accessoire_2_index = random_acces_2
	elif loto_temporaire > 60:
		var random_acces = repertoire_accessoires.pick_random()
		var left_or_right_hand = randi_range(1,2)
		if left_or_right_hand == 1:
			accessoire_1_index = random_acces
			accessoire_2_index = 0
		elif left_or_right_hand == 2:
			accessoire_1_index = 0
			accessoire_2_index = random_acces
	else:
		accessoire_1_index = 0
		accessoire_2_index = 0
		
	set_face()
	
## les fonctions liées au jeu de la porte


	
func verifier_bonhomme(reponse_joueur):
	if reponse_joueur == "jaune":
		if vetements_index == 2 or vetements_index == 6 or vetements_index == 7:
			npc_jaunes += 1
			if npc_jaunes > 25 :
				print("QUOTA DÉPASSÉ : - 1 vie")
				vies_joueur -= 1
				audio_fail.play()
				if vies_joueur < 1:
					game_over = true
			if npc_jaunes == 25:
				print("QUOTA JAUNE ATTEINT - NE PLUS LAISSER ENTRER DE NPC JAUNE")
				audio_full.play()
			if npc_jaunes <= 25:
				if repertoire_acces_interdit.has(accessoire_1_index) or repertoire_acces_interdit.has(accessoire_2_index):
					print("accessoire interdit")
					vies_joueur -= 1
					audio_fail.play()
					if vies_joueur < 1:
						game_over = true
				else:
					var win_sound_array = [audio_ok, audio_ok_2, audio_ok_3]
					var win_sound_choisi = win_sound_array.pick_random()
					win_sound_choisi.play()
		else:
			print("MAUVAISE FILE : - 1 vie")
			vies_joueur -= 1
			audio_fail.play()
			if vies_joueur < 1:
				game_over = true
	if reponse_joueur == "orange":
		if vetements_index == 0 or vetements_index == 5:
			npc_orange += 1
			if npc_orange > 25 :
				print("QUOTA DÉPASSÉ : - 1 vie")
				vies_joueur -= 1
				audio_fail.play()
				if vies_joueur < 1:
					game_over = true
			if npc_orange == 25:
				audio_full.play()
				print("QUOTA ORANGE ATTEINT - NE PLUS LAISSER ENTRER DE NPC ORANGE")
			if npc_orange <= 25:
				if repertoire_acces_interdit.has(accessoire_1_index) or repertoire_acces_interdit.has(accessoire_2_index):
					print("accessoire interdit")
					vies_joueur -= 1
					audio_fail.play()
					if vies_joueur < 1:
						game_over = true
				else:
					var win_sound_array = [audio_ok, audio_ok_2, audio_ok_3]
					var win_sound_choisi = win_sound_array.pick_random()
					win_sound_choisi.play()
		else:
			print("MAUVAISE FILE : - 1 vie")
			vies_joueur -= 1
			audio_fail.play()
			if vies_joueur < 0:
				game_over = true
		
	
	update_the_ui()
	
	
	if reponse_joueur == "rejet":
		print("personnage rejeté")
		var zap_array = [audio_zap, audio_zap_2, audio_zap_3]
		var zap_choisi = zap_array.pick_random()
		zap_choisi.play()
	bonhomme.hide()
	if game_over == false:
		bonhomme_random()
	


func _on_timer_game_timeout() -> void:
	game_time -= 1
	update_the_ui()
	if game_time > 0:
		timer_game.wait_time = 1
		timer_game.start()
	else:
		game_over = true
		print("Vous avez recruté " + str(npc_jaunes) + " NPC jaune sur 25 et " + str(npc_orange) + " NPC orange sur 20.")


func _on_bouton_jaune_pressed() -> void:
	verifier_bonhomme("jaune")


func _on_bouton_orange_pressed() -> void:
	verifier_bonhomme("orange")


func _on_bouton_rejet_pressed() -> void:
	verifier_bonhomme("rejet")
