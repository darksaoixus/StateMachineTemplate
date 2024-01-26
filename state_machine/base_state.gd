class_name BaseState
extends RefCounted

var key: int
var previous_key: int

func _init(k: int) -> void:
	key = k


func enter(pk: int) -> void:
	previous_key = pk

# Optionally, you could make separate methods for input handling.
# I'm leaving it this way for the sake of simplicity.
#
# This method return the key of the next state. Return the current
# state key to not change it.
func update() -> int:
	return key


func exit() -> void:
	pass
