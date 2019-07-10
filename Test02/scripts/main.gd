extends Node

onready var gem = preload("res://scenes/gem.tscn")
onready var gem_container = get_node("gem_container")
onready var score_label = get_node("HUD/score_label")

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
		g.connect("gem_grabbed", self, "_on_gem_grabbed")
		g.set_position(Vector2(rand_range(40, screensize.x-40), rand_range(40, screensize.y-40)))
		
func _on_gem_grabbed():
	score += 10
	score_label.text = str(score)
	print(score)

func _process(delta):
	if gem_container.get_child_count() == 0:
		level += 1
		spawn_gems(level * 10)
