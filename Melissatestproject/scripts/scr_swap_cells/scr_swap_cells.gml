/// @param Cell_1
/// @param Cell_2

var cell = argument0;
var cell2 = argument1;
if ((cell == -1) || (cell2 == -1)) return -1;

// Get Cell 1 Properties
var cObj = scr_get_cell_object(cell);
var cQ = scr_get_cell_quantity(cell);
var cLocked = scr_get_cell_locked(cell);

// Get Cell 2 Properties
var cObj2 = scr_get_cell_object(cell2);
var cQ2 = scr_get_cell_quantity(cell2);
var cLocked2 = scr_get_cell_locked(cell2);

// Put Cell 2 Contents into Cell 1
scr_set_cell_object(cell, cObj2);
scr_set_cell_quantity(cell, cQ2, 1);
scr_set_cell_locked(cell, cLocked2);

// Put Cell 1 Contents into Cell 2
scr_set_cell_object(cell2, cObj);
scr_set_cell_quantity(cell2, cQ, 1);
scr_set_cell_locked(cell2, cLocked);