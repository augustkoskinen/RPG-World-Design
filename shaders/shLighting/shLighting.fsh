varying vec2 pos; //current pixel position
varying vec4 col;
uniform vec2 u_pos; //light source positon

const float zz = 3200; //larger zz, larger light

void main(){
    vec2 dis = pos - u_pos;
    float str = 0.5/(sqrt(dis.x*dis.x*.25 + dis.y*dis.y*.25 + zz*zz)-zz); //strength of light is the inverse distance
    gl_FragColor = col*vec4(vec3(str),1.);
}

/*
varying vec2 pos; //current pixel position
uniform vec2 u_pos; //light source positon

const float zz = 0.1; //larger zz, larger light

void main(){
    vec2 dis = pos - u_pos;
    float str = 8./(sqrt(dis.x*dis.x + dis.y*dis.y + zz*zz)-zz); //strength of light is the inverse distance
    gl_FragColor = vec4(vec3(str),vec4(1s.0));
}
*/