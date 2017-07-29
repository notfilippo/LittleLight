varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform float time;
uniform vec2 resolution;
uniform vec2 vignette_settings;
uniform vec3 vignette_color;
uniform vec3 player_light_color;
uniform vec2 player_position;

#define PI 3.14159265358979323846

float rand(vec2 co){
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

float wave(float from, float to, float duration, float offset) {
	float a4 = (to - from) * 0.5;
	return from + a4 + sin((((time * 0.001) + duration * offset) / to) * PI * 2.0) * a4;
}
 
void main() {

    vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);

    float vignette = distance(vec2(0.5, 0.5), v_vTexcoord);
    vignette = vignette_settings.x - vignette * vignette_settings.y;
	vignette = smoothstep(0.0, 1.0, vignette);
    vec3 vignette_rgb = vignette_color / 255.0 * vignette;
	
	base.rgb = mix(base.rgb, base.rgb * vignette_rgb, 0.2);
	
	float player_light = distance(player_position / resolution, v_vTexcoord);
	player_light = smoothstep(0.2, 0.0, player_light);
    vec4 player_light_rgba = vec4(player_light_color / 255.0 * player_light, wave(0.7, 1.0, 2.0 * rand(floor(v_vTexcoord) * time), 0.0));
	
	base = mix(base, base * player_light_rgba, 0.3);
	
    gl_FragColor = v_vColour * base;
}
