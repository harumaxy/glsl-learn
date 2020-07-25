shader_type canvas_item;

void vertex(){
	VERTEX +=  vec2(cos(TIME), sin(TIME)) * 100.;
}