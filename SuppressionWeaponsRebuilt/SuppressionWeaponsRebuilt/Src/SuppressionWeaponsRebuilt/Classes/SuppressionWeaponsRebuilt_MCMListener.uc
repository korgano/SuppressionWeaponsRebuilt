//Set up the MCM menu here. The config must be a non-existent config in the mod folder, so that it will be created by xcom2.

class SuppressionWeaponsRebuilt_MCMListener extends UIScreenListener config(SuppressionWeaponsRebuilt);

`include(SuppressionWeaponsRebuilt/Src/ModConfigMenuAPI/MCM_API_Includes.uci);
`include(SuppressionWeaponsRebuilt/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci);

var config bool RIFLE_ENABLED;
var config bool BULLPUP_ENABLED;
var config bool SPARK_ENABLED;
var config bool PISTOL_ENABLED;
var config bool SIDEARM_ENABLED;
var config bool SHOTGUN_ENABLED;
var config bool CANNON_ENABLED;
var config bool SNIPER_ENABLED;
var config bool VEKTOR_ENABLED;
var config bool NAME_ENABLED;
var config int CONFIG_VERSION;

/*event OnInit(UIScreen Screen)
{
	if (MCM_API(Screen) != none)
	{
		//class'IniLoader'.static.LazyInitializer();
		`MCM_API_Register(Screen, ClientModCallback);
	}
}*/

event OnInit(UIScreen Screen)
{
    if (MCM_API(Screen) != none)
    {
        `MCM_API_Register(Screen, ClientModCallback);
		`log("SWR - ClientModCallback Triggered!");
    }

    if(UIShell(Screen) != none)
    {
        EnsureConfigExists();
		`log("SWR - EnsureConfigExists Triggered!");
    }
}

function EnsureConfigExists()
{
    if(ConfigVersion == 0)
    {
		//class'IniLoader'.static.LazyInitializer();
        LoadSavedSettings();
		`log("SWR - LoadSavedSettings Triggered!");
        SaveButtonClicked(none);
    }
}

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
    local MCM_API_SettingsPage Page;
    local MCM_API_SettingsGroup Group;
    
	`log("SWR - ClientModCallback running!");
    LoadSavedSettings();
    
    Page = ConfigAPI.NewSettingsPage("Suppression Weapons");
    Page.SetPageTitle("Suppression Weapons Rebuilt");
    Page.SetSaveHandler(SaveButtonClicked);
    
    Group = Page.AddGroup('Group1', "General Settings");
    //Group.AddSlider('slider', "Setting", "Tooltip", 0.0, 10.0, 1, SETTING, , SliderSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Rifles/SMGs", "Suppression apllied to non-blacklisted Rifles/SMGs", RIFLE_ENABLED, RifleCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Bullpups", "Suppression apllied to non-blacklisted Bullpups", BULLPUP_ENABLED, BullpupCheckboxSaveHandler);
    
    Page.ShowSettings();
}

`MCM_CH_VersionChecker(class'SuppressionWeaponsRebuilt_MCMConfig'.default.CONFIG_VERSION,CONFIG_VERSION)

simulated function LoadSavedSettings()
{
    //SETTING = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SETTING,SETTING);
	`log("SWR - LoadSavedSettings running!");
	RIFLE_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.RIFLE_ENABLED,RIFLE_ENABLED);
	BULLPUP_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.BULLPUP_ENABLED,BULLPUP_ENABLED);
}

//Every setting needs its own save handler here (slidersavehandler2, 3, etc...)
//`MCM_API_BasicSliderSaveHandler(SliderSaveHandler, SETTING)
`MCM_API_BasicCheckboxSaveHandler(RifleCheckboxSaveHandler, RIFLE_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(BullpupCheckboxSaveHandler, BULLPUP_ENABLED)

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
    self.CONFIG_VERSION = `MCM_CH_GetCompositeVersion();
    self.SaveConfig();
}

/* //these example functions can be added to other classes to get the values out
function float GetValue()
{
	local float value;
	value = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SETTING,class'SuppressionWeaponsRebuilt_MCMListener'.default.SETTING);
    return value;
}

function bool GetBool()
{
    return `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.bSETTING,class'SuppressionWeaponsRebuilt_MCMListener'.default.bSETTING);
}
*/

defaultproperties
{
    ScreenClass = none;
}
