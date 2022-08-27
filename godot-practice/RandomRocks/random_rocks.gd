extends Node2D

const ROCKS := [
	preload("rocks/Rock1.tscn"),
	preload("rocks/Rock2.tscn"),
	preload("rocks/Rock3.tscn"),
]

onready var mask: TileMap = $Mask


func _ready() -> void:
	randomize()
	add_rocks_on_grid()
	# Hide the mask tiles, otherwise we will get an unwanted shade on the
	# game level.
	mask.visible = false


func get_random_rock() -> Sprite:
	var rock_random_index := randi() % ROCKS.size()
	return ROCKS[rock_random_index].instance()


func add_rocks_on_grid() -> void:
	# TileMap.get_used_cells() returns an array of Vector2 cell coords
	# where we drew a tile.
	for cell in mask.get_used_cells():
		var rock := get_random_rock()
		add_child(rock)
		var rock_size := rock.scale * rock.texture.get_size()
		# Because the Mask node has a cell_size property, we use it instead of
		# the property hard-coded CELL_SIZE constant
		var available_space := mask.cell_size - rock_size
		var random_offset := Vector2(randf(), randf()) * available_space
		rock.position = mask.position + mask.map_to_world(cell) + random_offset
