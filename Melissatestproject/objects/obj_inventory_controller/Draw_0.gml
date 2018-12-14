draw_set_font(fnt_inventory);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(600, 10, "FPS: " +string(fps_real));

// Draw the Controls
draw_text(30, 250, "Inventory Controls:");
draw_text(30, 270, "Q - Quick Stack Current Tab");
draw_text(30, 290, "W - Organize Tab");
draw_text(30, 310, "E - Empty Current Tab");
draw_text(30, 330, "Left Press - Pickup / Place Full Stack");
draw_text(30, 350, "Right Click - Pickup 1 at a time");
draw_text(30, 370, "Esc - Cancle Pickup");
draw_text(30, 390, "Arrow Keys (Mouse Wheel) - Move Tab View");
draw_text(30, 410, "Tab - Merge Test Items to Backpack");


// Draw the Inventories
scr_inventory_draw(inv1);
scr_inventory_draw(inv2);

// Draw the Selected Items
if !(selectedItem == -1) {
	var sprite = object_get_sprite(selectedItem);
	draw_sprite(sprite, 0, mouse_x, mouse_y);
	draw_set_valign(fa_bottom);
	draw_text(mouse_x - (sprite_get_width(sprite) / 2), mouse_y + (sprite_get_width(sprite) / 2), selectedQuantity);
}


// Draw the Tooltip
if (scr_get_cell_object(cC) != -1) {
	var tooltipStr = "This is a sample description. A suggestion i have is find what object is stored in the inventory and base your description off that."
	if (hook[0] == -1) scr_tooltip(cC, tooltipStr);
}