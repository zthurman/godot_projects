extends Node

onready var gem = preload("res://scenes/gem.tscn")
onready var gem_container = get_node("gem_container")

var screensize
var score = 0
var level = 1

func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	set_process(true)
	spawn_gems(10)

func spawn_gems(num):
	for i in num:
		var g = gem.instance()
		gem_container.add_child(g)
		g.set_position(Vector2(rand_range(40, screensize.x-40), rand_range(40, screensize.y-40)))

func _process(delta):
	if gem_container.get_child_count() == 0:
		level += 1
		spawn_gems(level * 10)
