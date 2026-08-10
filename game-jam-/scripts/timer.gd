extends Control
var timer = 0.0
@onready var lable = $Label
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	lable.text = str(snapped(timer, 0.01))
