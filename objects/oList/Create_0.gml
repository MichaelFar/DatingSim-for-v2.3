/// @description Insert description here
// You can write your code in this editor
width = 400;
height = 600;

hasDestroyed = false;



global.hasRun = false;
metaString = "";
objectCounter = 0;
createObjectString = "Create Object";
objectArray = 0;
objectArray[0] = "0";
shouldBreak = false;

list = ds_list_create();

if(instance_exists(oChoice) || instance_exists(oTextBox))
{
	instance_destroy(oChoice);
	instance_destroy(oTextBox);
	hasDestroyed = true;
}
//show_debug_message(string(list));

global.musicVolume = 100;
global.voiceVolume = 100;

hoverID = -1;
event_user(0);