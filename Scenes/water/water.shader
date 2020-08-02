shader_type canvas_item;

// UV : vec2, canvasItem の原点 ~ (w, h) の間で 0 ~ 1 の値を取るグローバル変数
// Color に適用するときれいなグラデーションができるので、シェーダーのテストによく使う


// texture(Sample2D, vec2) : 第2引数のvec2 で 0 ~ 1 を指定し、与えられたSample2D(テクスチャ)の色を取ってくる
// 1 を超えたUV座標でリピートする場合、import タブで repeat を有効化して再インポートする

// TEXTURE : このマテリアルがアタッチされている CanvasItem の描画要素を Sample2D として渡すグローバル変数
// Sprite なら Texture

uniform vec2 tiled_factor = vec2(5.);
uniform float aspect_ratio = 0.5;

uniform vec2 time_scale = vec2(1.);
uniform vec2 offset_scale = vec2(2.);
uniform vec2 amplitude = vec2(0.05, 0.1);

vec2 make_wave(vec2 uvs, float time){
	vec2 wave_uv_offset;
	wave_uv_offset.x = cos(time * time_scale.x + uvs.x + uvs.y) * offset_scale.x;
	wave_uv_offset.y = sin(time * time_scale.y + uvs.x + uvs.y) * offset_scale.y;
	return wave_uv_offset;
}

void fragment(){
	vec2 tiled_uvs = UV * tiled_factor;
	tiled_uvs.y *= aspect_ratio;
//	COLOR = vec4(0., tiled_uvs, 1.);	
	

//	COLOR = texture(TEXTURE, tiled_uvs + vec2(0.05, 0.05));  // texture を取ってくるUV位置を少しずらすと、ずれた位置の色を取ってくる
//	COLOR = vec4(make_wave(tiled_uvs, TIME), 0., 1.);
	COLOR = texture(TEXTURE, tiled_uvs + make_wave(tiled_uvs, TIME) * amplitude);
}