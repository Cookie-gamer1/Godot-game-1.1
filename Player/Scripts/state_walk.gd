class_name state_Walk extends State

@export var move_speed : float = 100.0
@onready var idle: State = $"../Idle"
@onready var attack: state_Attack = $"../Attack"

func Enter() -> void:
	player.update_animation("Walk")
	pass

func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	player.velocity = player.direction * move_speed
	if player.set_direction():
		player.update_animation("Walk")
	return null

func Physics(_delta: float) -> State:
	return null

func Handle_input(_event: InputEvent) -> State:
	return null
