//
// Simple passthrough fragment shader
//
//uniform vec2 uWDpixelDims;
//uniform vec4 _uniUV;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float ydiff;

void main()
{
	if(texture2D(gm_BaseTexture, v_vTexcoord).a == 0.) {
		gl_FragColor = vec4(0.);
	} else {
		/*
		if(ydiff<=0.&&subtractOn)
			gl_FragColor = vec4(0.,0.,0.,1.);//texture2D(gm_BaseTexture, v_vTexcoord);
		else if(ydiff>0.&&subtractOn) {
			gl_FragColor = vec4(1.,1.,1.,0.);//texture2D(gm_BaseTexture, v_vTexcoord);
		}*/
		//gl_FragColor = vec4(1.,1.,1.,0.);
		gl_FragColor = vec4(0.,0.,0.,1.);//0.,0.,0.,

	}
}
