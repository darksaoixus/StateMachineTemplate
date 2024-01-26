class_name Player
extends CharacterBody2D

enum States {
	IDLE,
	WALK,
	RUN,
}

const WALK_SPEED := 200.0
const RUN_SPEED = 300.0

var current_speed := 0.0

var _state_machine := StateMachine.new()

func _ready() -> void:
	_setup_state_machine()


func _physics_process(_delta: float) -> void:
	_state_machine.update()


func move_with_current_speed(dir: Vector2) -> void:
	velocity = dir.normalized() * current_speed
	move_and_slide()


# The boolean flag below is used to set which state will be the first one of the machine.
# I know booleans flags aren't the best practice but it shouldn't be hard to understand
# what they do in this case.
func _setup_state_machine() -> void:
	_state_machine.add_state(PlayerIdle.new(self), true)
	_state_machine.add_state(PlayerWalk.new(self))
	_state_machine.add_state(PlayerRun.new(self))
