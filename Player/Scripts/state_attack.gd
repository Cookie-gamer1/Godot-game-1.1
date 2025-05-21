class_name state_Attack extends State

var attacking : bool = false  

@export var attack_sound: AudioStream
@onready var Hurtbox: hurtbox = $"../../interactions/Hurtbox"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"  
@onready var attack_animation_player: AnimationPlayer = $"../../Sprite2D/Attack sprite/AnimationPlayer"
@onready var walk: state_Walk = $"../Walk"  
@onready var idle: state_Idle = $"../Idle"  
@onready var audio: AudioStreamPlayer2D = $"../../audio/AudioStreamPlayer2D"

func Enter() -> void:  
	player.update_animation("Attack")  
	animation_player.animation_finished.connect(EndAttack)  
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true  # Set attacking to true when entering attack state 
	attack_animation_player.play("Attack_" + player.anim_direction()) 
	await get_tree().create_timer(0.075).timeout
	Hurtbox.monitoring = true

func Exit() -> void:  
	animation_player.animation_finished.disconnect(EndAttack)  # Clean up the signal when exiting the state  
	attacking = false
	Hurtbox.monitoring = false

func Process(_delta: float) -> State:  
	player.velocity = Vector2.ZERO  
	if attacking == false:  
		if player.direction == Vector2.ZERO:  
			return idle  # Transition to idle if no direction  
		else:  
			return walk  # Transition to walk if there's direction  
	return null  

func Physics(_delta: float) -> State:  
	return null  # Currently not needed, but make sure it fits your needs  

func Handle_input(_event: InputEvent) -> State:  
	return null  # Implement input handling if needed  

func EndAttack(_newAnimName: String) -> void:  
	attacking = false  # Reset attacking status on animation finish  
	# Optionally change state back to idle or walk here based on player's context
