//Set up the MCM menu here. The config must be a non-existent config in the mod folder, so that it will be created by xcom2.

class SuppressionWeaponsRebuilt_MCMListener extends UIScreenListener config(SuppressionWeaponsRebuiltConfig);

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
var config bool bLog;
var config int CONFIG_VERSION;

event OnInit(UIScreen Screen)
{
	if (MCM_API(Screen) != none)
	{
		//class'IniLoader'.static.LazyInitializer();
		`MCM_API_Register(Screen, ClientModCallback);
        `log("Suppression Weapons Rebuilt - ClientModCallback Triggered!");
	}
}

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
    local MCM_API_SettingsPage Page;
    local MCM_API_SettingsGroup Group;
    
	`log("Suppression Weapons Rebuilt - ClientModCallback running!");
    LoadSavedSettings();
    
    Page = ConfigAPI.NewSettingsPage("Suppression Weapons");
    Page.SetPageTitle("Suppression Weapons Rebuilt");
    Page.SetSaveHandler(SaveButtonClicked);
    
    Group = Page.AddGroup('Group1', "General Settings");
    Group.AddCheckbox('checkbox', "Enable Suppression Rifles/SMGs", "Adds Suppression to non-blacklisted Rifles/SMGs.", RIFLE_ENABLED, RifleCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Bullpups", "Adds Suppression to non-blacklisted Bullpups.", BULLPUP_ENABLED, BullpupCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Spark Rifles", "Adds Suppression to non-blacklisted Spark Rifles.", SPARK_ENABLED, SparkCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Pistols", "Adds Suppression to non-blacklisted Pistols.", PISTOL_ENABLED, PistolCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Sidearms", "Adds Suppression to non-blacklisted Sidearms.", SIDEARM_ENABLED, SidearmCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Shotguns", "Adds Suppression to non-blacklisted Shotguns.", SHOTGUN_ENABLED, ShotgunCheckboxSaveHandler);
    Group.AddCheckbox('checkbox', "Enable Suppression Cannons", "Adds Suppression to non-blacklisted Cannons.", CANNON_ENABLED, CannonCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Sniper Rifles", "Adds Suppression to non-blacklisted Sniper Rifles.", SNIPER_ENABLED, SniperCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Suppression Vektor Rifles", "Adds Suppression to non-blacklisted Vektor Rifles.", VEKTOR_ENABLED, VektorCheckboxSaveHandler);

    Group = Page.AddGroup('Group2', "Logging");
	Group.AddCheckbox('checkbox', "Enable Template Logging", "Dumps template names to log.", NAME_ENABLED, NameCheckboxSaveHandler);
	Group.AddCheckbox('checkbox', "Enable Function Logging", "Logs actions of AddAbility function.", bLog, LogCheckboxSaveHandler);
    
    Page.ShowSettings();
}

`MCM_CH_VersionChecker(class'SuppressionWeaponsRebuilt_MCMConfig'.default.CONFIG_VERSION,CONFIG_VERSION)

simulated function LoadSavedSettings()
{
    //SETTING = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SETTING,SETTING);
	`log("Suppression Weapons Rebuilt - LoadSavedSettings running!");
	RIFLE_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.RIFLE_ENABLED,RIFLE_ENABLED);
	BULLPUP_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.BULLPUP_ENABLED,BULLPUP_ENABLED);
	SPARK_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SPARK_ENABLED,SPARK_ENABLED);
	PISTOL_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.PISTOL_ENABLED,PISTOL_ENABLED);
	SIDEARM_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SIDEARM_ENABLED,SIDEARM_ENABLED);
	SHOTGUN_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SHOTGUN_ENABLED,SHOTGUN_ENABLED);
	CANNON_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.CANNON_ENABLED,CANNON_ENABLED);
	SNIPER_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.SNIPER_ENABLED,SNIPER_ENABLED);
	VEKTOR_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.VEKTOR_ENABLED,VEKTOR_ENABLED);
	NAME_ENABLED = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.NAME_ENABLED,NAME_ENABLED);
	bLog = `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.bLog,bLog);
}

//Every setting needs its own save handler here (slidersavehandler2, 3, etc...)
//`MCM_API_BasicSliderSaveHandler(SliderSaveHandler, SETTING)
`MCM_API_BasicCheckboxSaveHandler(RifleCheckboxSaveHandler, RIFLE_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(BullpupCheckboxSaveHandler, BULLPUP_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(SparkCheckboxSaveHandler, SPARK_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(PistolCheckboxSaveHandler, PISTOL_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(SidearmCheckboxSaveHandler, SIDEARM_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(ShotgunCheckboxSaveHandler, SHOTGUN_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(CannonCheckboxSaveHandler, CANNON_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(SniperCheckboxSaveHandler, SNIPER_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(VektorCheckboxSaveHandler, VEKTOR_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(NameCheckboxSaveHandler, NAME_ENABLED)
`MCM_API_BasicCheckboxSaveHandler(LogCheckboxSaveHandler, bLog)

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
