shader_type canvas_item;


uniform float tile_factor = 10.;
uniform float aspect_ratio = 0.5;
uniform sampler2D uv_offset_texture: hint_black;
uniform vec2 uv_offset_size = vec2(1.);
uniform vec2 wave_size = vec2(.1);
uniform float time_scale = 0.05;

uniform float sine_time_scale = .03;
uniform vec2 sine_offset_scale = vec2(.4);
uniform float sine_wave_size = .04;


vec2 calc_waves_offset(float time, float multiplier, vec2 uv, vec2 offset_scale){
	float multiplied_time = time * multiplier;
	float unique_offset = uv.x + uv.y;
	float x = sin(multiplied_time + unique_offset * offset_scale.x);
	float y = cos(multiplied_time + unique_offset * offset_scale.y);
	return vec2(x, y);
}


void fragment(){
	vec2 base_uv_offset = UV * uv_offset_size;
	base_uv_offset += TIME * time_scale;
	
	vec2 texture_based_offset = texture(uv_offset_texture, base_uv_offset).rg;
	texture_based_offset = texture_based_offset * 2.0 - 1.0;
	texture_based_offset *= wave_size;
	
	vec2 adjusted_uv = UV * tile_factor;
	adjusted_uv.y *= aspect_ratio;
	
	vec2 waves_offset = calc_waves_offset(TIME, sine_time_scale, adjusted_uv, sine_offset_scale);
	COLOR = texture(TEXTURE, adjusted_uv + texture_based_offset + sine_wave_size * waves_offset);
//	COLOR = vec4(texture_based_offset, vec2(0., 1.));

}