/*
**  Usage:
**     scr_draw_text_outline(text,x,y,outline_width,outline_color,text_color)
*/

//draw outline
draw_set_color(argument4)
for (i=-argument3;i<argument3+1;i+=1) 
    {
    for (j=-argument3;j<argument3+1;j+=1)
        {
        draw_text(argument1+i,argument2+j,string_hash_to_newline(argument0))
        }
    }

//draw text
draw_set_color(argument5)
draw_text(argument1,argument2,string_hash_to_newline(argument0))

//reset color
draw_set_color(c_white)