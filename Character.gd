extends CanvasGroup

@export var head: Texture2D = null
@export var body: Texture2D = null
@export var arm: Texture2D = null


@onready var head_sprite: Sprite2D = $HEAD
@onready var body_sprite: Sprite2D = $BODY
@onready var arm_sprite: Sprite2D = $ARM

@export var head_turning_amount: float = 30
@export var arm_turning_amount: float = 90.0

func _ready() -> void:
	if head != null:
		head_sprite.texture = head
	
	if body != null:
		body_sprite.texture = body
	
	if arm != null:
		arm_sprite.texture = arm


func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	
	if mouse_position.x < head_sprite.global_position.x:
		scale.x = -1
	else:
		scale.x = 1
		
	
	head_sprite.look_at(mouse_position)
	head_sprite.rotation = deg_to_rad(clamp(rad_to_deg(head_sprite.rotation), -head_turning_amount, head_turning_amount))
	
	arm_sprite.look_at(mouse_position)
	arm_sprite.rotation = deg_to_rad(clamp(rad_to_deg(arm_sprite.rotation), -arm_turning_amount, arm_turning_amount))
	



func change_head(texture: Texture2D) -> void:
	head_sprite.texture = texture


func change_body(texture: Texture2D) -> void:
	body_sprite.texture = texture


func change_arm(texture: Texture2D) -> void:
	arm_sprite.texture = texture
