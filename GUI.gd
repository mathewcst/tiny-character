extends CanvasLayer

@export var character: Node2D

@onready var head_label: Label = $MarginContainer/NinePatchRect/VBoxContainer/HeadLabel
@onready var arm_label: Label = $MarginContainer/NinePatchRect/VBoxContainer/ArmLabel

@onready var head_slider: HSlider = $MarginContainer/NinePatchRect/VBoxContainer/HeadProgress
@onready var arm_slider: HSlider = $MarginContainer/NinePatchRect/VBoxContainer/ArmProgress

var head: Sprite2D
var arm: Sprite2D

var head_turning_amount: int = 0
var arm_turning_amount: int = 0

func _ready() -> void:
	head = character.get_node('HEAD')
	arm = character.get_node('ARM')
	
	head_turning_amount = character.head_turning_amount
	arm_turning_amount = character.arm_turning_amount
	
	head_slider.set_value(head_turning_amount)
	arm_slider.set_value(arm_turning_amount)


func _process(delta: float) -> void:
	head_label.text =  'Head Rotation: ' + str(head_turning_amount) + '°'
	arm_label.text = 'Arm Rotation: ' + str(arm_turning_amount) + '°'


func _on_head_progress_value_changed(value: float) -> void:
	character.head_turning_amount = value
	head_turning_amount = value


func _on_arm_progress_value_changed(value: float) -> void:
	character.arm_turning_amount = value
	arm_turning_amount = value
