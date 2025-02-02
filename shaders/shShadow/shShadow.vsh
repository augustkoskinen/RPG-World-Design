attribute vec3 in_Position;                  // (x,y,z)

uniform vec2 u_pos; //light source positon
const float len = 100000.;

varying float tdis = 0;
varying float ldis = 0;

void main(){
    vec2 pos = in_Position.xy;
	
	vec2 dis = pos - u_pos;
	float sdis = length(dis);
	
    if (in_Position.z > 0.) { //check if vertex requires repositioning
        pos += dis/sdis * len; //repositioning the vertex with respect to the light position
		tdis = in_Position.z-2;
		ldis = 1.;
    } else {
		ldis = sdis/len;
		tdis = mix(0.5,in_Position.z,ldis);
	}
	
    vec4 object_space_pos = vec4( pos.x, pos.y, 0., 1.0); //shadow is drawn at a z-value closer to the screen than its corresponding light.
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}

/*
attribute vec3 in_Position;                  // (x,y,z)

uniform vec2 u_pos; //light source positon
const float len = 100000;

varying float tdis;
varying float ldis;

void main(){
    vec2 pos = in_Position.xy;
	vec2 dis = pos - u_pos;
	vec2 sdis = length(dis);//sqrt(dis.x*dis.x + dis.y*dis.y);
    if (in_Position.z > 1.){ //check if vertex requires repositioning
        vec2 dis = pos - u_pos;
        pos += dis/sdis * len.; //repositioning the vertex with respect to the light position
		tdis = in_Position.z-2;
		ldis = 1.;
    } else {
		ldis = sdis/len;
		tdis = mix(0.5,in_Position.z,ldis);
	}
    vec4 object_space_pos = vec4( pos.x, pos.y, 0., 1.0); //shadow is drawn at a z-value closer to the screen than its corresponding light.
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}*/