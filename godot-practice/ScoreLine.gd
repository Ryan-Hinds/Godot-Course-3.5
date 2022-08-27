extends HBoxContainer

# First get the two label nodes and store them for later usage with onready variables
onready var points_label := $PointsLabel
onready var name_label := $NameLabel

# For each of the labels, we define a function that will call
# the scorebaord
func set_player_points(points_value: String) -> void:
	points_label.text = points_value.pad_zeros(6)
	

func set_player_name(player_name: String) -> void:
	name_label.text = player_name
