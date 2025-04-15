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
