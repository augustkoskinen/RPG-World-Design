//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float ydiff;

void main()
{
    if(texture2D(gm_BaseTexture, v_vTexcoord).a == 0.) {
		gl_FragColor = vec4(0.);
	} else {
		if(ydiff<=0.)
			gl_FragColor = vec4(0.,0.,0.,1.);//texture2D(gm_BaseTexture, v_vTexcoord);
		else if(texture2D(gm_BaseTexture, v_vTexcoord).a != 0.) {
			gl_FragColor = vec4(1.);//texture2D(gm_BaseTexture, v_vTexcoord);
		}

	}
}
