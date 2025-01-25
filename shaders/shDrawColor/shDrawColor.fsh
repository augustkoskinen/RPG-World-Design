//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_color;
uniform float u_alpha;

void main()
{
	vec4 draw = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(83.0/170.0,162.0/170.0,170.0/170.0,u_alpha*texture2D( gm_BaseTexture, v_vTexcoord ).w);
	//u_color.x,u_color.y,u_color.z,
}
