class_name StateMachine
extends RefCounted

var _states := {}
var _current_state: BaseState

func update() -> void:
	var next_key := _current_state.update()
	if next_key != _current_state.key:
		_change_state_to(next_key)


func add_state(new_state: BaseState, initial := false) -> void:
	_states[new_state.key] = new_state
	
	if initial:
		_current_state = _states[new_state.key]
		_current_state.enter(-1)


func _change_state_to(target_key: int) -> void:
	if _states.get(target_key) == null:
		push_error("It was not possible to find the state")
		return
	
	var previous_key := _current_state.key
	
	_current_state.exit()
	_current_state = _states[target_key]
	_current_state.enter(previous_key)
