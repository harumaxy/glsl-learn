shader_type canvas_item;


uniform float tiled_factor = 10.;
uniform float aspect_ratio = 0.5;

// uniform のうち、int, float, vec4, sampler2D にはヒントを設定できる (デフォルト値、エディターで編集するためのレンジ)
// https://docs.godotengine.org/ja/stable/tutorials/shading/shading_reference/shading_language.html#functions
uniform sampler2D uv_offset_texture: hint_black;
uniform vec2 uv_offset_size = vec2(1.);
uniform vec2 wave_size = vec2(.1);
uniform float time_scale = 0.03;

void fragment(){
	vec2 offset_texture_uvs = UV * uv_offset_size;
	offset_texture_uvs += TIME * time_scale;
	
	vec2 texture_based_offset = texture(uv_offset_texture, offset_texture_uvs).rg;
	texture_based_offset = texture_based_offset * 2.0 - 1.0;
	
	vec2 adjusted_uv = UV * tiled_factor;
	adjusted_uv.y *= aspect_ratio;
	COLOR = texture(TEXTURE, adjusted_uv + texture_based_offset * wave_size);
//	COLOR = vec4(texture_based_offset, vec2(0., 1.));
	NORMALMAP = texture(NORMAL_TEXTURE, UV + texture_based_offset * wave_size).rgb;
}