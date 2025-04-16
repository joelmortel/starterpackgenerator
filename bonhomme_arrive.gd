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
@onready var accessoires_1: AnimatedSprite2D = $bonhomme/Accessoires/accessoires1
@onready var accessoires_2: AnimatedSprite2D = $bonhomme/Accessoires/accessoires2

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


func _ready() -> void:
	hide()


func remake_bonhomme(fiche_technique: Array):
	show()
	peau.modulate = fiche_technique[0]
	vetements.frame = fiche_technique[1]
	oreilles.frame = fiche_technique[2]
	tete.frame = fiche_technique[3]
	yeux.frame = fiche_technique[4]
	yeux_couleur.modulate = fiche_technique[5]
	nez.frame = fiche_technique[6]
	bouche.frame = fiche_technique[7]
	cheveux.frame = fiche_technique[8]
	accessoires_1.frame = fiche_technique[9]
	accessoires_2.frame = fiche_technique[10]
	cheveux.modulate = fiche_technique[11]
	oreilles.modulate = fiche_technique[0]
	tete.modulate = fiche_technique[0]
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Vector2(300, 300), 1)
	
func byebye_bonhomme():
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	tween1.tween_property(self, "rotation", 360, 1)
	tween2.tween_property(self, "global_position", Vector2(300, -500), 1)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
