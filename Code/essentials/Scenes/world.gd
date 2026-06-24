extends Node2D

@export var hobbit: Hobbit
@export var wizard: Wizard


func _on_wizard_cast_spell() -> void:
	hobbit.hit_by_spell()

func _on_hobbit_kill_wizard() -> void:
	wizard.hit_by_hobbit()
