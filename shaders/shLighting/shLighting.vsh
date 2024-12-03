attribute vec3 in_Position;  // (x,y,z)  
attribute vec4 in_Colour;

varying vec2 pos;
varying vec4 col;

void main(){
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0., 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	//glReadPixels
	
    pos = in_Position.xy;
	//if(in_Colour.g==228./255.) col = vec4(1.0);
	//else col = vec4(0.);
	col = vec4(in_Colour.a,in_Colour.b,in_Colour.g,in_Colour.r);
}