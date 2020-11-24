/// @description Insert description here
// 
var nameHeight = string_height(name);
var stringHeight = string_height(text);

draw_self();
draw_set_color(c_white);
charCount += typeSpeed;
textType = string_copy(text, 1, charCount);

//draw_rectangle(room_width / 2, room_height / 2, x + boxWidth, y + boxHeight, 1);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, 20, boxWidth - 100);