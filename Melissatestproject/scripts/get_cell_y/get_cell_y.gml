/// @description get_cell_y(grid_x, grid_y, tile_height)
/// @param grid_x
/// @param  grid_y
/// @param  tile_height
var grid_x = argument0;
var grid_y = argument1;
var tile_h = argument2;

return (grid_y * tile_h) + (grid_x * tile_h);
