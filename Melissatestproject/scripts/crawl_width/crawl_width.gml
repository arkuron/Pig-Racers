/// @description crawl_width(grid, direction, tile_wide, current_x, current_y)
/// @param grid
/// @param  direction
/// @param  tile_wide
/// @param  current_x
/// @param  current_y
var _grid = argument0;
var _direction = argument1;
var _tiles_wide = argument2; //not width, but tiles wide
var _current_x = argument3;
var _current_y = argument4;

//first this does the middle one
ds_grid_set(_grid, _current_x, _current_y, 2); //remember this for the floor, hence the 2

switch(_direction) {
    case 2: 
    case 1: 
        for(_cwc = 1;_cwc <= _tiles_wide;_cwc++) {
            ds_grid_set(_grid,_current_x,_current_y-_cwc,2);
            ds_grid_set(_grid,_current_x,_current_y+_cwc,2);
        }
        break;
    case 3: 
    case 4: 
        for(_cwc = 1;_cwc <= _tiles_wide;_cwc++) {
            ds_grid_set(_grid,_current_x-_cwc,_current_y,2);
            ds_grid_set(_grid,_current_x+_cwc,_current_y,2);
        }
        break;
}

