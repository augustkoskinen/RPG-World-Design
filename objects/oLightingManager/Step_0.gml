//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;
with(oSolidPar){
    Quad(_vb,bbox_left,bbox_top,bbox_right,bbox_bottom); //Negative Slope Diagonal Wall
    Quad(_vb,bbox_left,bbox_bottom,bbox_right,bbox_top);
}
vertex_end(vb);