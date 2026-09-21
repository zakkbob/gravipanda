extends Sprite2D

var startY: float;
var time = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startY = position.y;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta;
	self.position.y = startY + sin(time * 3) * 5;

func _on_area_2d_body_entered(body: Node2D) -> void:
	LevelManager.next();
