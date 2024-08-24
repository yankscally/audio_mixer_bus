@tool
extends Button

var name_window = ConfirmationDialog.new()
var layout_name = "new layout"

func _init():
	name_window.visible = false
	connect("pressed", open_dialog)
	
	var save_as = LineEdit.new()
	save_as.text = layout_name
	save_as.connect("text_changed", update_layout_name)
	name_window.connect("confirmed", save.bind(layout_name))
	
	name_window.add_child(save_as)
	add_child(name_window)
	
	
func open_dialog():
	if name_window.visible:
		name_window.hide()
	else:
		name_window.size = Vector2(150,90)
		name_window.position = Vector2i(get_viewport_rect().size/2) - name_window.size/2
		name_window.show()

func update_layout_name(new_name):
	layout_name = new_name

func save(save_as):
	var layout_path = "res://layout/"
	var full_path = layout_path + save_as + ".tres"
	print(full_path)
	Mixer.save_layout(full_path)
