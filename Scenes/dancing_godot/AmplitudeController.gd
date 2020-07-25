tool
extends VBoxContainer


signal amplitude_changed(amplitude)

var amplitude = 10.0 setget set_amplitude
onready var label_start_text = $Label.text


func _on_HSlider_value_changed(value: float):
	self.amplitude = value

func set_amplitude(value: float):
	amplitude = value
	$Label.text = label_start_text + " " + str(amplitude)
	self.emit_signal("amplitude_changed", value)
