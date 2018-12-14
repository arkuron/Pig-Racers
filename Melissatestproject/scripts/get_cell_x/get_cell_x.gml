/// @description get_cell_x(grid_x, grid_y, tile_width)
/// @param grid_x
/// @param  grid_y
/// @param  tile_width
var grid_x = argument0;
var grid_y = argument1;
var tile_w = argument2;

return (grid_x * tile_w) - (grid_y * tile_w)
