function flag_parser(_flag, _branches, _branchAddress, _index) {
	//This script will find flags and handle them
	//If a text line has a flag and is displayed the player should have a flag initialized
	/*
	context is merely an identifier for the programmer and does not do anything to the code

		Flag types:

		[_EX]text_context_context; means that a future line of text is replaced by another line of text
		_EX is a tag on the flag that denotes if two tags are inherently incompatible
	
		RS_-_num(must be a word)_name  ||  RS_+_num(must be a word)_name; means that a characters relationship is affected by an amount
			in the RS_ flag the - or + sign signifies to add or remove relationship points [x/5]
			name is the name of the character

		prom_name; during the prom scene you have a prom score threshold that the player must meet to get good ending
	*/

	//var _flag = argument[0];
	//var _branches = argument[1];
	//var _branchAddress = argument[2];
	//var _index = argument[3];
	var _EX = 0;
	var _iterator = _index;
	var i = 0;
	var _buffer = 0;
	//if(string_pos("text_", _flag) != 0) 
	//{
		
	for (i = 0; i < array_length_1d(global.flags); i++) 
	{
		if (string_pos("[", global.flags[i]) != 0)  //Checks for flag exclusivity clause
		{
			_buffer = string_delete(global.flags[i], string_pos("[", global.flags[i]), string_pos("]", global.flags[i]));
			show_debug_message("_buffer is now " + _buffer);
			_EX = string_replace(global.flags[i], _buffer, "");
			//_EX = string_delete(global.flags[i], string_pos("]", global.flags[i])  + 1, string_length(global.flags[i]));
			show_debug_message("_EX = " + _EX);
		}
		else 
		{
			_EX = "NOT EXCLUSIVE";	
		}

		if(_flag != global.flags[i] && string_pos(_EX, _flag) != 0 && string_pos(_EX, global.flags[i]) != 0)
		{
			show_debug_message("Replacing flag " + global.flags[i] + " with flag " + _flag);
			global.flags[i] = _flag;
		}
		/*
		show_debug_message(global.flags);
		show_debug_message("global.flags size is " + string(array_length_1d(global.flags)));
		*/
		if(string_pos("PenisChamp", _branches[_branchAddress, _index]) != 0)
		{
			_branches[_branchAddress, _index] = string_replace_all(_branches[_branchAddress, _index], "PenisChamp", global.playerName);
		}
		if(string_pos("Penischamp", _branches[_branchAddress, _index]) != 0)
		{
			_branches[_branchAddress, _index] = string_replace_all(_branches[_branchAddress, _index], "Penischamp", global.playerName);
		}
	
		if(string_pos(global.flags[i], _branches[_branchAddress, _index]) == 0)	
		{
			while(_iterator < array_length_2d(_branches, _branchAddress) 
			&& string_pos(_EX,_branches[_branchAddress, _iterator]) != 0 
			&& string_pos(global.flags[i],_branches[_branchAddress, _iterator]) == 0) 
			{
				_iterator++;
			}
		}
	
		if(_iterator == array_length_2d(_branches, _branchAddress))
		{	
			instruction_parser(global.instructions);
			_iterator--;
			break;	
		}
		else if (string_pos(global.flags[i],_branches[_branchAddress, _iterator]) != 0) 
		{
			_branches[_branchAddress, _iterator] = 
			string_delete(_branches[_branchAddress, _iterator], 
			string_pos(global.flags[i], _branches[_branchAddress, _iterator]),
			string_length(global.flags[i]));
		}		
	}
	global.newFlagIndex = _iterator;


	if(string_pos("BACKGROUND_FLAG", _branches[_branchAddress, _iterator]) != 0)
	{
		getBackground(_branches[_branchAddress, _iterator]);
		for(i = 0; i < array_length_1d(global.backGrounds); i++)
		{
			_branches[_branchAddress, _iterator] = string_replace(_branches[_branchAddress, _iterator],"BACKGROUND_FLAG" + global.backGrounds[i], "");
		}
	}

	return _branches[_branchAddress, _iterator];



}
