// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function text_log()
{
	var _spriteIndex = asset_get_index("SPRlogBox");
	var _spriteWidth = sprite_get_width(_spriteIndex);
	var _spriteHeight = sprite_get_height(_spriteIndex);
	var _x = room_width / 2;
	var _y = 1;
	
	for(var i = 0; i < global.textHistoryTracker; i++)
	{
		show_debug_message(" Y location of logBox is " + string(_y));
		
		create_LogBox(_x, _y + (_spriteHeight * i), i);
	}
	
}