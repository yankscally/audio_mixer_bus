@tool
extends EditorPlugin

var dock
func _enter_tree():
	# Initialization of the plugin goes here.
	# Load the dock scene and instantiate it.
	dock = preload("res://addons/audio_mixer_bus/audio_mixer_control/mixer/mixer_control.tscn").instantiate()

	# Add the loaded scene to the docks.
	add_control_to_bottom_panel(dock, "Mixer")

func _exit_tree():
	remove_control_from_bottom_panel(dock)
	pass
