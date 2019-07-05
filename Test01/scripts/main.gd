extends Node

onready var sprite = preload("res://scenes/Sprite.tscn")

func _ready():
	for i in range(20):
		var s = sprite.instance()
		add_child(s)
