extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func die():
	
	queue_free()

	
func attack():
	if $Attack.is_colliding():
		var target = $Attack.get_collider()
		print(target)
		if target.has_method("damage"):
			target.damage()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite.animation="Fall"
	elif abs(velocity.x)>0 and $Sprite.animation !="Walk":
		$Sprite.play("Walk")
		var player_walk= get_node("/root/Game/Player_Walk")
		player_walk.play()
	elif velocity.x==0:
		$Sprite.animation="Idle"
		
	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite.play("Jump")
		var player_jump= get_node("/root/Game/Player_Jump")
		player_jump.play()
		
	if Input.is_action_just_pressed("Attack") and is_on_floor():
		$Sprite.play("Attack")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if direction<0:
			$Sprite.flip_h=true
	else:
		$Sprite.flip_h=false;
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("Left") or ("Right") and is_on_floor():
		$Grass.emitting=true
	
	move_and_slide()
