# control mixer
# a control node version to complement mixer.gd
# not needed for most projects, but useful for debugging and audio based projects.
@tool 
extends Control
class_name ControlMixer
@onready var control_bus_scene = load("res://addons/audio_mixer_bus/audio_mixer_control/bus/bus_control.tscn")




var bus_naming : String

signal bus_added


func _init():
	AudioServer.bus_layout_changed.connect(layout_changed)

func add_master_bus():
	var bus = Mixer.buses[0]
	var control_bus = add_control_bus()
	control_bus.name = bus.bus_name
	control_bus.bus = bus
	%buses.add_child(control_bus)

func add_control_bus():
	var control_bus = control_bus_scene.instantiate()
	return control_bus

func _on_add_bus_pressed():
	var bus = Mixer.add_bus()
	var control = add_control_bus()
	control.bus = bus
	%buses.add_child(control)
	
	if size.x < get_window().size.x - 50:
		size.x += 50
	
	
func layout_changed():
	pass
	#print("///")
	#for bus in Mixer.buses:
		#print(bus.bus_name)
		
func _ready():
	for bus in Mixer.buses:
		var new_control = add_control_bus()
		new_control.bus = bus
		new_control.name = bus.bus_name
		%buses.add_child(new_control)
	

func _on_save_layout_pressed():
	pass # Replace with function body.


func _on_bus_name_text_changed(new_text):
	bus_naming = new_text
