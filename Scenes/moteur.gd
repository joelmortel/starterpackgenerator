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

@onready var accesoire_1: MenuButton = $Menu/Accesoire1
@onready var label_acc_1: Label = $Menu/Accesoire1/Label_Acc_1
@onready var accesoire_2: MenuButton = $Menu/Accesoire2
@onready var label_acc_2: Label = $Menu/Accesoire2/Label_Acc_2

@onready var accessoi_1: AnimatedSprite2D = $template/sprites_accessoires/accessoi_1
@onready var accessoi_2: AnimatedSprite2D = $template/sprites_accessoires/accessoi_2

@onready var label_nom: Label = $template/label_nom



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


func _ready() -> void:
	accesoire_1.get_popup().id_pressed.connect(_on_accesoire_1_pressed)
	accesoire_2.get_popup().id_pressed.connect(_on_accesoire_2_pressed)
	set_face()

func _physics_process(delta: float) -> void:
	pass


## boutons pour la face

func _on_tete_left_pressed() -> void:
	tete_index -= 1
	set_face()


func _on_tete_droite_pressed() -> void:
	tete_index += 1
	set_face()
	


	
	

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
	

func _on_yeux_left_pressed() -> void:
	yeux_index -= 1
	set_face()


func _on_yeux_droite_pressed() -> void:
	yeux_index += 1
	set_face()


func _on_oreilles_left_pressed() -> void:
	oreille_index -= 1
	set_face()


func _on_oreilles_droite_pressed() -> void:
	oreille_index += 1
	set_face()


func _on_nez_left_pressed() -> void:
	nez_index -= 1
	set_face()


func _on_nez_droite_pressed() -> void:
	nez_index += 1
	set_face()


func _on_bouche_left_pressed() -> void:
	bouche_index -= 1
	set_face()


func _on_bouche_droite_pressed() -> void:
	bouche_index += 1
	set_face()


func _on_cheveux_left_pressed() -> void:
	cheveux_index -= 1
	set_face()


func _on_cheveux_droite_pressed() -> void:
	cheveux_index += 1
	set_face()


func _on_vetements_left_pressed() -> void:
	vetements_index -= 1
	set_face()


func _on_vetements_droite_pressed() -> void:
	vetements_index += 1
	set_face()


func _on_clr_peau_left_pressed() -> void:
	clr_peau_index -= 1
	set_face()


func _on_clr_peau_droite_pressed() -> void:
	clr_peau_index += 1
	set_face()


func _on_aleatoire_pressed() -> void:
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
	set_face()


func _on_clr_yeux_left_pressed() -> void:
	clr_yeux_index -= 1
	set_face()


func _on_clr_yeux_droite_pressed() -> void:
	clr_yeux_index += 1
	set_face()


func _on_clr_cheveux_left_pressed() -> void:
	clr_cheveux_index -= 1
	set_face()


func _on_clr_cheveux_droite_pressed() -> void:
	clr_cheveux_index += 1
	set_face()


## boutons accessoires


func _on_accesoire_1_pressed(id: int) -> void:
	print(id)
	
	accessoire_1_index = id
	accessoi_1.frame = accessoire_1_index
	
	match id:
		0:
			label_acc_1.text = "*********"
		1:
			label_acc_1.text = "Micro"
		2:
			label_acc_1.text = "Clope"
		3:
			label_acc_1.text = "Bière"
		4:
			label_acc_1.text = "Téléphone"
		5:
			label_acc_1.text = "Guitare"
		6:
			label_acc_1.text = "Hockey"
		7:
			label_acc_1.text = "Voiture"
		8:
			label_acc_1.text = "Netflix"
		9:
			label_acc_1.text = "Pot"
		10:
			label_acc_1.text = "Fusil"
		11:
			label_acc_1.text = "Romantique"
		12:
			label_acc_1.text = "Beigne"
		13:
			label_acc_1.text = "Gamer"
		14:
			label_acc_1.text = "Pomme"
		15:
			label_acc_1.text = "Café"
		16:
			label_acc_1.text = "Vin"
			
func _on_accesoire_2_pressed(id: int) -> void:
	print(id)
	
	accessoire_2_index = id
	accessoi_2.frame = accessoire_2_index
	
	match id:
		0:
			label_acc_2.text = "*********"
		1:
			label_acc_2.text = "Micro"
		2:
			label_acc_2.text = "Clope"
		3:
			label_acc_2.text = "Bière"
		4:
			label_acc_2.text = "Téléphone"
		5:
			label_acc_2.text = "Guitare"
		6:
			label_acc_2.text = "Hockey"
		7:
			label_acc_2.text = "Voiture"
		8:
			label_acc_2.text = "Netflix"
		9:
			label_acc_2.text = "Pot"
		10:
			label_acc_2.text = "Fusil"
		11:
			label_acc_2.text = "Romantique"
		12:
			label_acc_2.text = "Beigne"
		13:
			label_acc_2.text = "Gamer"
		14:
			label_acc_2.text = "Pomme"
		15:
			label_acc_2.text = "Café"
		16:
			label_acc_2.text = "Vin"


func _on_line_edit_text_changed(new_text: String) -> void:
	label_nom.text = new_text
