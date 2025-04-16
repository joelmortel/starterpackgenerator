extends Node2D

@onready var chat_croco: Label = $AnimatedSprite2D/chat_croco
@onready var pouce_sprite: AnimatedSprite2D = $crocojack/pouce_sprite
@onready var crocojack_sprite: AnimatedSprite2D = $crocojack/crocojack_sprite



func croco_parle(replique: String, resultat: String):
	
	match resultat:
		"good":
			pouce_sprite.frame = 2
		"bad":
			pouce_sprite.frame = 1
		"normal":
			pouce_sprite.frame = 0
			
	
	crocojack_sprite.play("talk")
	
	chat_croco.visible_ratio = 0
	chat_croco.text = replique
	var tween = get_tree().create_tween()
	tween.tween_property(chat_croco, "visible_ratio", 1, 1)
	await tween.finished
	crocojack_sprite.play("idle")
