/// @description draw the lines

if (status == 0) { // set the colour of the line (black means they can unlock it, gray is still locked)
	draw_set_colour(c_gray)
} else {
	draw_set_colour(c_black)
}

for (d=0; d<needcount; d++) // loop around all of the lines we have already cached and draw them
{
    draw_line_width(x,y,linetox[d],linetoy[d],2)
};
