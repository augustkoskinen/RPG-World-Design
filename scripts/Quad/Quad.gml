//Creates Quad with two triangles. Used to make the shadows.
//Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb,_x1,_y1,_x2,_y2){
	//Upper triangle
    vertex_position_3d(_vb,_x1,_y1,0);
    vertex_position_3d(_vb,_x1,_y1,2); //repositioned vertex
    vertex_position_3d(_vb,_x2,_y2,1);

    //Lower Triangle
    vertex_position_3d(_vb,_x1,_y1,2); //repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,1);
    vertex_position_3d(_vb,_x2,_y2,3); //repositioned vertex
}