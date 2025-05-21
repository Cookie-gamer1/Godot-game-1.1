class_name enime_state_wander extends enime_state

@export var enim_name : String = "walk"
@export var wander_speed : float = 20.0

@export_category("AI")

@export var state_animation_duration : float = 0.5
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 3
@export var next_state : enime_state

var timer : float = 0.0
var direction : Vector2
# Called when the node enters the scene tree for the first time.
func init() -> void:
	pass

func enter() -> void:
	timer = randi_range(state_cycles_min, state_cycles_max) * state_animation_duration
	var rand = randi_range(0, 3)
	direction = enemy.DIR_4[rand]
	enemy.velocity = direction * wander_speed
	enemy.set_direction(direction)
	enemy.update_animation(enim_name)
	pass

func exit() -> void:
	pass

func process(_delta: float) -> enime_state:
	timer -= _delta
	if timer < 0:
		return next_state 
	return null

func physics(_delta: float) -> enime_state:
	return null
