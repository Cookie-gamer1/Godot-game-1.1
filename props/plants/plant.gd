class_name plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Hitbox.damaged.connect(Take_damage)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
func Take_damage(_damage : int) -> void:
	queue_free()
	pass
