//
// Simple passthrough fragment shader
//
//uniform vec2 uWDpixelDims;
//uniform vec4 _uniUV;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	if(texture2D(gm_BaseTexture, v_vTexcoord).a == 0.) {
		gl_FragColor = vec4(0.);
	} else {
		gl_FragColor = vec4(0.,0.,0.,1.);//texture2D(gm_BaseTexture, v_vTexcoord);

	}
}
