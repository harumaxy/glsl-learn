tool
extends Sprite



func calc_aspect_ratio():
	(material as ShaderMaterial).set_shader_param("aspect_ratio", scale.y/scale.x)
	

func _ready():
	pass

