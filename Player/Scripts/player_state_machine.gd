class_name PlayerStateMachine extends Node

var states : Array[ State ]
var prev_state : State
var current_state : State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_state(current_state.Process(delta))
	pass

func _physics_process(delta: float) -> void:
	change_state(current_state.Physics(delta))
	pass

func _unhandled_input(event):
	change_state(current_state.Handle_input(event))

func initalise(_player: Player) -> void:
	states = []
	for c in get_children():
		if c is State:
			c.player = _player  # Assign the player reference to each state
			states.append(c)
	if states.size() > 0:
		change_state(states[0])  # Set the first state as the initial state
		process_mode = Node.PROCESS_MODE_INHERIT


func change_state(new_state: State) -> void:
	if new_state == null or new_state == current_state:
		return  # Ignore invalid or redundant state changes

	if current_state:
		current_state.Exit()
	
	prev_state = current_state
	current_state = new_state
	current_state.Enter()
