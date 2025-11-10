extends CharacterBody2D
@export var speed: float = 220.0
@onready var sprite: Sprite2D = $Sprite2D
@onready var anim: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float):
	var input_vec := Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_vec * speed
	move_and_slide()
	if velocity.length() > 0.1:
		sprite.rotation = velocity.angle()
	if anim.current_animation != "walk":
		anim.play("walk")
	else:
		if anim.current_animation != "idle":
			anim.play("idle")
