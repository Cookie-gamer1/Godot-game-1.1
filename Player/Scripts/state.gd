class_name State
extends Node

var player: Player  # Instance-specific reference to the player

func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	return null  # Default to remaining in the same state

func Physics(_delta: float) -> State:
	return null  # Default to remaining in the same state

func Handle_input(_event: InputEvent) -> State:
	return null  # Default to remaining in the same state
