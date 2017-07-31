#define PI 3.14159265358979323846
#define MAX_LIGHTS 20

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform float time;
uniform vec2 resolution;
uniform vec3 player_light_color;
uniform vec2 player_position;
uniform vec3 light_color;
uniform vec3 lights[MAX_LIGHTS];
uniform float max_power;
uniform float power;

float rand(vec2 co){
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

float wave(float from, float to, float duration, float offset) {
	float a4 = (to - from) * 0.5;
	return from + a4 + sin((((time * 0.001) + duration * offset) / to) * PI * 2.0) * a4;
}
 
void main() {

    vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec2 player_light_dis = v_vTexcoord - player_position / resolution;
	float player_light = length(player_light_dis);
	player_light = smoothstep(clamp(power / max_power, 0.4, 0.6) - 0.2, clamp(power / max_power, 0.4, 0.6) - 0.2 - 0.5, player_light);
    vec4 player_light_rgba = vec4(player_light_color / 255.0 * player_light, 1);
	
	base = mix(base, base * player_light_rgba, clamp(power / max_power, 0.2, 0.8));
	
	vec2 light_dis;
	float light;
	float light_count;
	vec4 light_rgb;
	
	for (int i = 0; i < MAX_LIGHTS; i++) {
		if (lights[i].z == 1.0) {
			light_dis =  v_vTexcoord - lights[i].xy / resolution;
			light = length(light_dis);
			light = smoothstep(clamp(1.0 - power / max_power, 0.4, 0.6) - 0.2, clamp(1.0 - power / max_power, 0.4, 0.6) - 0.2 - 0.5, light);
		    light_rgb += vec4(light_color / 255.0 * light, 1);
			light_count++;
		}
	}
	
	base = mix(base, base * light_rgb, clamp(1.0 - power / max_power, 0.2, 0.8));
	
    gl_FragColor = v_vColour * base;
}
