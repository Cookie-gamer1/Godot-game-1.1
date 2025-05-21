class_name EnemyStateMachine extends Node

var states : Array[enime_state]
var prev_state : enime_state
var current_state : enime_state

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass

func _process(delta):
	_change_state(current_state.process(delta))
	pass


func _physics_process(delta):
	_change_state(current_state.physics(delta))
	pass


func initalize(_enemy: enimy):
	states=[]
	for c in get_children():
		if c is enime_state:
			states.append(c)
	
	for s in states:
		s.enemy = _enemy
		s.state_machine = self
		s.init()
		
	if states.size() > 0:
		_change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT 
		
	
func _change_state(new_state : enime_state) -> void:
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	prev_state = current_state
	current_state = new_state
	current_state.enter()
