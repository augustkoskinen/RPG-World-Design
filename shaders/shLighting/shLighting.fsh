varying vec2 pos; //current pixel position
varying vec4 col;
uniform vec2 u_pos; //light source positon

const float zz = 6400.; //larger zz, larger light

void main(){
    vec2 dis = pos - u_pos;
	float str = (0.5/(pow(sqrt(dis.x*dis.x*.25 + dis.y*dis.y*.25 + zz*zz)-zz,1.4)))-5.;
	//float str = (0.5/(pow(sqrt(dis.x*dis.x*.25 + dis.y*dis.y*.25 + zz*zz)-zz, 1.4)))-10.;
    //float str = min(0.5/(sqrt(dis.x*dis.x*.25 + dis.y*dis.y*.25 + zz*zz)-zz),1.1); //strength of light is the inverse distance
	gl_FragColor = col*vec4(vec3(min(str,0.9)),1.);
}