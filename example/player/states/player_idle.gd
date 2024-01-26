class_name PlayerIdle
extends "res://example/player/states/player_base_state.gd"

func _init(pl: Player) -> void:
	super(Player.States.IDLE, pl)

func enter(pk: int) -> void:
	super(pk)
	
	player.current_speed = 0.0


func update() -> int:
	var vec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if vec != Vector2.ZERO:
		return Player.States.WALK
	
	return key


func exit() -> void:
	pass
