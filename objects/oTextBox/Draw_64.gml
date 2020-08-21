/// @description Insert description here
// 
var nameHeight = string_height(name);
var stringHeight = string_height(text);


draw_set_color(c_white);

//draw_rectangle(room_width / 2, room_height / 2, x + boxWidth, y + boxHeight, 1);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), text, 20, boxWidth - 100);