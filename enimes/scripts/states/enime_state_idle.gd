class_name enime_state_idle extends enime_state

@export var enim_name : String = "idle"

@export_category("AI")

@export var state_duration_min : float = 0.5
@export var state_duration_max : float = 1.5
@export var next_state : enime_state

var timer : float = 0.0
# Called when the node enters the scene tree for the first time.
func init() -> void:
	pass

func enter() -> void:
	enemy.velocity = Vector2.ZERO
	timer = randf_range(state_duration_min, state_duration_max)
	enemy.update_animation(enim_name)
	pass

func exit() -> void:
	pass

func process(_delta: float) -> enime_state:
	timer -= _delta
	if timer <= 0:
		return next_state
	return null

func physics(_delta: float) -> enime_state:
	return null
