extends Sprite

var screensize
var extents
var pos
var vel
var spin

func _ready():
	randomize()
	screensize = get_viewport_rect().size
	extents = get_texture().get_size() / 2
	pos = screensize / 2
	vel = Vector2(rand_range(100, 300), 0).rotated(rand_range(0, 2*PI))
	spin = rand_range(-PI, PI)
	set_process(true)

func _process(delta):
	set_rotation(get_rotation() + spin * delta)
	pos += vel * delta
	if pos.x >= screensize.x - extents.x:
		pos.x = screensize.x - extents.x
		vel.x *= -1
	if pos.x <= extents.x:
		pos.x = extents.x
		vel.x *= -1
	if pos.y >= screensize.y - extents.y:
		pos.y = screensize.y - extents.y
		vel.y *= -1
	if pos.y <= extents.y:
		pos.y = extents.y
		vel.y *= -1
	set_position(pos)
