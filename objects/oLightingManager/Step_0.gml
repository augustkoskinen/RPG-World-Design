//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;
with(oSolidPar){
    Quad(_vb,bbox_left-camera_get_view_x(view_camera[0]),bbox_top-camera_get_view_y(view_camera[0]),bbox_right-camera_get_view_x(view_camera[0]),bbox_bottom-camera_get_view_y(view_camera[0])); //Negative Slope Diagonal Wall
    Quad(_vb,bbox_right-camera_get_view_x(view_camera[0]),bbox_top-camera_get_view_y(view_camera[0]),bbox_left-camera_get_view_x(view_camera[0]),bbox_bottom-camera_get_view_y(view_camera[0]));
}
vertex_end(vb);