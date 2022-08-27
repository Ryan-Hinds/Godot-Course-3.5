extends Control

onready var scoreboard := $ScoreBoard
onready var name_field := $HBoxContainer/NameForm 

func _on_ConfirmButton_pressed() -> void:
	scoreboard.add_line(name_field.text)
	scoreboard.show()
	name_field.text = ""
