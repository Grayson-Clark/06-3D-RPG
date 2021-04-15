extends RayCast

onready var Player = get_node("/root/Game/Player")

func _ready():
	add_exception(Player)

func _physics_process(delta):
	if is_colliding() and get_collider().is_in_group("target"):
		Player.target = get_collider()
		var pos = get_collision_point()
		$Reticle.global_transform.origin = pos
	elif $Reticle.translation != Vector3(0,0,50):
		$Reticle.translation = Vector3(0,0,50)
		if Player.target != null:
			Player.target = null
