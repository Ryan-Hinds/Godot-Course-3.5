extends PanelContainer

onready var scores_column := $MarginContainer/VBoxContainer/ScoresContainer

var player_scores = {
	"Scroog McDuck": 99999,
	"Magicka De Spell": 75250,
	"Gyro Gearloose": 500,
	"Daisy Duck": 250,
}

func _ready() -> void:
	for name in player_scores:
		add_line(name, str(player_scores[name]))


func add_line(player_name: String, player_points: String) -> void:
	# Loads the ScoreLine scene and creates a new instance of it.
	var line := preload("ScoreLine.tscn").instance()
	# We can add the ScoreLine instance as a child of the ScoresColumn like
	# plain nodes.
	scores_column.add_child(line)
	# As instanced the ScoreLine scene, we can call the function we defined
	# on it
	line.set_player_name(player_name)
	line.set_player_points(player_points)
	# If there is a key matching player_name in the dictionary,
	# update the corresponding score,
	# otherwise it will add the score
	player_scores[player_name] = player_points


func add_timer(duration: float) -> void:
	# Create the timer node.
	var timer := Timer.new()
	# We set the timer to last duration seconds and not cycle.
	timer.wait_time = duration
	timer.one_shot = true
	# Add to the child of the node this is attached too.
	add_child(timer)


func _on_HideButton_pressed() -> void:
	hide()
