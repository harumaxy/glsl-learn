shader_type canvas_item;

uniform float time_factor = 1.0;
uniform vec2 amplitude = vec2(1.0);

void vertex(){
	float theta = TIME * time_factor + VERTEX.x + VERTEX.y;
	VERTEX +=  vec2(cos(theta), sin(theta)) * amplitude;
}