class_name player_camera extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Level_manager.TileMapBoundsChanged.connect( update_limits ) 
	update_limits(Level_manager.current_tilemap_bounds)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_limits(bounds:Array[Vector2]) -> void:
	limit_left = int(bounds[0].x) 
	limit_top = int(bounds[0].y) 
	limit_right = int(bounds[1].x) 
	limit_bottom = int(bounds[1].y) 
	pass
	
