varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float power;

void main() {

	vec4 tex_color = texture2D(gm_BaseTexture, v_vTexcoord);
	tex_color.r *= power;
	tex_color.g *= power;
    gl_FragColor = v_vColour * tex_color;
}
