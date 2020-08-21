/// @arg x
/// @arg y
/// @arg text
function create_menu_type() {


	// Arguments
	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[2];

	//Create Different Buttons for main menu

	instance_destroy(oButton);

	var _objectType = oQuitConfirm;

		if (_text == "Options") 
		{
			_objectType = oOptions;
			create_list(_x - (300 / 2), _y - (240 / 2), 300, 240, LIST_TYPE.SETTINGS);
		}
		else if(_text == "Load Save") 
		{
			_objectType = oSaveLoad;
		}
		else if(_text != "New Game")
		{
			game_end();
		}
	
	_x -= (sprite_get_width(object_get_sprite(_objectType))) / 2; //Here we adjust the coordinates of the sprite to fit room
	_y -= (sprite_get_height(object_get_sprite(_objectType))) / 2; //This was coded in such a way where any sprite may be used





}
