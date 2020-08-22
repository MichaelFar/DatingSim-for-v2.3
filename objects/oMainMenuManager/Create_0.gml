/// @description Insert description here
// You can write your code in this editor
global.newGame = false;
//soundHandler(intro, false);
if(!audio_is_playing(intro) && !audio_is_playing(part_that_loops))
{
	global.currentMusic = audio_play_sound(intro, 1000 ,false);
}

global.currentSettings = 10;
global.savedGames = 0;
global.textSpeed = 1;
global.numSaves = 0;
global.savedGames[global.numSaves] = "";
global.wasInMainMenu = false;
global.saveGameBuffer = "";
if(file_exists("Settings.txt"))
{
	script_execute(load_settings);
	
	audio_sound_gain(global.currentMusic, global.musicVolume / 100, 0);	
}
for(var i = 0; i < 16; i++)
{
	global.savedGames[i] = "(NO SAVE)";
}
if(file_exists("listOfSaves.txt"))
{
	script_execute(loadStorage);
}
global.settingsIndex = 0;
global.inPauseMenu = false;
		var background_layer = layer_get_id("Background");
		var background_id = layer_background_get_id(background_layer);
		layer_background_sprite(background_id, SPRbackgroundSprites);
		layer_background_speed(background_id, 0);
		
		layer_background_index(background_id, 3);

event_user(0); //Game opens main menu