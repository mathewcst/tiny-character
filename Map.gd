extends Node2D

var pointer: Texture2D = preload('res://UI/01.png')

func _ready() -> void:
	Input.set_custom_mouse_cursor(pointer, Input.CURSOR_ARROW, Vector2(16, 16))
