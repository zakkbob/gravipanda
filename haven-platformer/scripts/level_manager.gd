extends Node

var currentLevel := 5;
var maxLevels := 5;

func _ready():
	update_scene();

func next() -> void:
	currentLevel = currentLevel % maxLevels + 1;
	update_scene();

func die() -> void:
	update_scene();

func update_scene():
	get_tree().change_scene_to_file("res://scenes/level%d.tscn" % currentLevel);
