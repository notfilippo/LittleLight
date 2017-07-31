varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float max_power;
uniform float power;
uniform int invert;

void main() {

	vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);
	
	base.r = clamp(base.r + power / max_power, 0.1, base.r);
	base.g = clamp(base.g + power / max_power, 0.1, base.g);
	base.b = clamp(base.b + 1.0 - power / max_power, base.b, 0.8);

    gl_FragColor = v_vColour * base;
}
