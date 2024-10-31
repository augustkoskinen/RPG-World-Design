varying float tdis;
varying float ldis;

void main(){
	//float str = 1.0 - abs(tdis-0.5)*2.0/ldis;
	gl_FragColor = vec4(1.); //1.
    //gl_FragColor = vec4(1.);//str //draws an invisible shadow that can block the light when Z-buffer is on
}