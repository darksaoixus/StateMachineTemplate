class_name PlayerRun
extends "res://example/player/states/player_base_state.gd"

func _init(pl: Player) -> void:
	super(Player.States.RUN, pl)


func enter(pk: int) -> void:
	super(pk)
	
	player.current_speed = player.RUN_SPEED


func update() -> int:
	var vec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if vec == Vector2.ZERO:
		return Player.States.IDLE
	elif Input.is_action_just_released("run"):
		return Player.States.WALK
	
	player.move_with_current_speed(vec)
	return key


func exit() -> void:
	pass
