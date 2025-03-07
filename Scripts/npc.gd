extends CharacterBody2D

const speed = 30 
var current_state = Idle

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

enum {
	Idle,
	new_direction,
	Move
}

func _ready():
	randomize()
	start_pos = position
	$Timer.start()  # Start the timer to change states

func _physics_process(delta):
	if is_roaming:
		match current_state:
			Idle:
				$AnimatedSprite2D.play("Idle1")
			new_direction:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.DOWN, Vector2.LEFT])
				current_state = Move  # Transition to Move state after choosing a new direction
			Move:
				move(delta)

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		velocity = dir * speed
		move_and_slide()  # Call without arguments

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([Idle, new_direction, Move])  # Randomly choose the next state
