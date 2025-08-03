class_name PlayerController
extends Node

var body: CharacterBody3D

var movement_command := MovementCommand.new()

func _init(b: CharacterBody3D) -> void:
	self.body = b
