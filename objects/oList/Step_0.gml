/// @description Insert description here
// You can write your code in this editor
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mousePress = mouse_check_button_pressed(mb_left);
var _buffer = 0;
var _saveBuffer = "";
var _choiceBuffer = "";
var _size = ds_list_size(list);
if(room = RMmainGame)
{
	metaString = get_meta();
	
}

//show_debug_message("The amount of options availibe is " + string(_size));
if(keyboard_check_pressed(vk_escape))
{
	if(room == RMmainMenu)
	{
		event_perform_object(oMainMenuManager, ev_other, ev_user0);
	}
	else if(global.inPauseMenu || type == LIST_TYPE.CHOICE_MENU)
	{
		instance_destroy();
		create_list(room_width / 2 - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
		shouldBreak = true;
		global.inPauseMenu = false;
	}
	else if(room == RMmainGame && type != LIST_TYPE.CHOICE_MENU)
	{
		instance_destroy();
		if(global.playerFlagCounter != 0)
		{
			global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[global.playerFlagCounter - 1]);
		}
		else
		{
			global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[global.playerFlagCounter]);
		}
		shouldBreak = true;
	}
}

if(array_length(global.currentSettings) < _size && type == LIST_TYPE.SETTINGS)
{
	
	for (var i = 0; i < _size; i++)
	{
		var _arr = list[| i];
		var	_sel = _arr[PR.SELECTED];
		var _name = _arr[PR.NAME];
		if(_name != "Text Speed")
		{
			global.currentSettings[i] = _sel;
		}
		else
		{
			global.currentSettings[i] = 0;
		}
	}
}



for (var i = 0; i < _size; i++)
{
	if(shouldBreak)
	{
		break;
		shouldBreak = false;
	}
	var _arr = list[| i];
	
	var	_name = _arr[PR.NAME];
	
	if(i < array_length(objectArray))
	{
		_buffer = objectArray[i];
	}
	
	
	
	var	_vals = _arr[PR.VALUES];
	if(i < array_length(global.currentSettings) && type == LIST_TYPE.SETTINGS)
	{
		var	_sel = global.currentSettings[i];
		
		switch (_name)
		{
			case "Music Volume":
			global.musicVolume = _vals[global.currentSettings[i]];			
			break;
			
			case "Voice Volume":
			global.voiceVolume = _vals[global.currentSettings[i]];
			break;
			
			case "Text Speed":
			global.textSpeed   = _vals[global.currentSettings[i]];			
			break;
		}
	}
	else
	{
		var	_sel = _arr[PR.SELECTED];
		if(_name == "Text Speed")
		{
			_sel = 0;
		}
	}
	var _x1 = x + padding;
	var _y1 = y + padding + itemH * i;
	var _x2 = x + width - padding;
	var _y2 = _y1 + itemH;
	
	
	
	var _hover = point_in_rectangle(_mouseX, _mouseY, _x1, _y1, _x2, _y2);
	
	if(_hover)
	{
		hoverID = i;
		
		if(i < array_length(global.savedGames))
		{
			if(global.savedGames[i] != "(NO SAVE)")
			{
				global.saveGameBuffer = global.savedGames[i];
			}
			else
			{
				global.saveGameBuffer = "";
			}
		}
		
		if(type == LIST_TYPE.CHOICE_MENU)
		{
			if(_name != "~~~~~~LOCKED~~~~~~")
			{
				_choiceBuffer = global.choiceLabels[i];
			}
		}
		
		if(_sel == -1 && _mousePress)
		{
			switch (_name)
			{
				case "Close":
					instance_destroy();
				break;
				//Settings Menu
				case "Apply":
					audio_sound_gain(global.currentMusic, global.musicVolume / 100, 0);
					script_execute(save_settings);
				break;
				//Pause menu
				case "Resume":
				
					instance_destroy(oList);
					
					if(global.playerFlagCounter != 0)
					{
						global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[global.playerFlagCounter - 1]);
					}
					else
					{
						global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[global.playerFlagCounter]);
					}
				break;
				
				case "Save":
				/*
					global.savedGames[global.numSaves] = save_game(metaString);
					global.numSaves++;
					
				*/
					instance_destroy();
					create_list(room_width / 2 - (300 / 2), room_height / 2 - (240 / 2), 300, 240, LIST_TYPE.SAVE_MENU);
					global.inPauseMenu = true;
				break;
				
				case "Load":
					instance_destroy();
					create_list(room_width / 2 - (300 / 2), room_height / 2 - (240 / 2), 300, 240, LIST_TYPE.LOAD_MENU);
					global.inPauseMenu = true;
				break;
				
				case "Options":
					instance_destroy();
					create_list(room_width / 2 - (300 / 2), room_height / 2 - (240 / 2), 300, 240, LIST_TYPE.SETTINGS);
					global.inPauseMenu = true;
				break;
				
				case "Return To Main Menu Without Saving":
					room_goto(RMmainMenu);
				break;
				
				case "Exit Without Saving":
					game_end();
				break;
				//TEST
				case "Create Object":
					ds_list_delete(list, _size - 1);
					createObjectString = "Create Object" + string(objectCounter);
					objectArray[objectCounter] = createObjectString;
					ds_list_add(list, [objectArray[objectCounter],-1,[]]);
					ds_list_add(list, ["Back",-1,[]]);
					objectCounter++;
					show_debug_message(createObjectString);
				break;
				case _buffer:
					ds_list_delete(list, _size - 1);
					createObjectString = "Create Object" + string(objectCounter);
					objectArray[objectCounter] = createObjectString;
					ds_list_add(list, [objectArray[objectCounter],-1,[]]);
					ds_list_add(list, ["Back",-1,[]]);
					objectCounter++;
					show_debug_message(createObjectString);
				break;
				//LOAD MENU
				case global.saveGameBuffer:
					/*
					instance_destroy();
					load_game(_saveBuffer);
					*/
					if(type == LIST_TYPE.LOAD_MENU)
					{
						instance_destroy();
						global.newGame = false;
						room_goto(RMmainGame);
					}
					else
					{
						global.savedGames[i] = save_game(metaString);
						_arr[@PR.NAME] = global.savedGames[i];
						global.numSaves++;
						script_execute(saveStorage);
					}
				break;
				
				case "(NO SAVE)":
					if(type == LIST_TYPE.SAVE_MENU)
					{
						global.savedGames[i] = save_game(metaString);
						_arr[@PR.NAME] = global.savedGames[i];
						global.numSaves++;
						script_execute(saveStorage);
					}
				
				break;
				
				case "Back":
					if(type == LIST_TYPE.TEST)
					{
						room_goto(RMmainMenu);
					}
					else if(type == LIST_TYPE.LOAD_MENU || type == LIST_TYPE.SAVE_MENU)
					{
						instance_destroy();
						if(room = RMmainGame)
						{
							
							create_list(room_width / 2 - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
						}
						else
						{
							room_goto(RMmainMenu);
						}
						global.inPauseMenu = false;
					}
				break;
				//CHOICE MENU
				
			
				case _choiceBuffer:
					if(!global.masterClickTracker[i])
					{
						instance_destroy();
						index = 0;
	
						exclusiveHandler(global.tempFlags[i], global.flags);
						//keyFinder();
						if (string_pos("{", global.tempFlags[i]) != 0)
						{
							global.boolFlags[global.flagIndex[i]] = true;
						}
	
						create_TB(global.branches, index + 1, global.choiceDestinations[i], on_click_TB, global.tempFlags[i]);
						shouldBreak = true;
					}
				break;
			}
			break;
		}
		if(_sel != -1)
		{
			global.currentSettings[i] = _sel;
		}
		if (_sel > -1)
		{
			var _wheel = mouse_wheel_up() - mouse_wheel_down();
			
			if (_wheel != 0)
			{
				_sel += _wheel;
				
				_sel = clamp(_sel, 0, array_length(_vals) - 1)
				
				_arr[@PR.SELECTED] = _sel;
				global.currentSettings[i] = _sel;
				show_debug_message("_sel is " + string(_sel));
				if (type == LIST_TYPE.SETTINGS)
				{
					switch (_name)
					{
						case "Music Volume":
						
							global.musicVolume = _vals[global.currentSettings[i]];
						
						break;
						
						case "Voice Volume":
							
							global.voiceVolume = _vals[global.currentSettings[i]];
						
						break;
						
						case "Text Speed":
						
							global.textSpeed = _vals[global.currentSettings[i]];
						
						break;
						
					}
				}
				
			}
			
		}
	}
	
}
