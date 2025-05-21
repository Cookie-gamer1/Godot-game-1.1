class_name state_Idle extends State

@onready var walk: state_Walk = $"../Walk"
@onready var attack: state_Attack = $"../Attack"

func Enter() -> void:
	player.update_animation("Idle")
	pass

func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

func Physics(_delta: float) -> State:
	return null

func Handle_input(_event: InputEvent) -> State:
	if _event. is_action_pressed("attack"):
		return attack
	return null
