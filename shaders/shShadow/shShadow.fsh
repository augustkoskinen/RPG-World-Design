varying float tdis;
varying float ldis;

void main(){
	float str = 1. - abs(tdis-0.5)*2./ldis;
	gl_FragColor = vec4(1.);//vec4(str); //1.0
}