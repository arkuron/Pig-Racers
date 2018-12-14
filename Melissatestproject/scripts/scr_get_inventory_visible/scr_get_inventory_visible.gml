/// @param InvID

var inv = argument0;
if (inv == -1) return -1;

return ds_map_find_value(inv, "locked");