class IniLoader extends Object;

// In the header somewhere
`include(MCM_Tutorial/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci)

var bool IniFileCreated;

// Somewhere in the function definitions
`MCM_CH_VersionChecker(class'SuppressionWeaponsRebuilt_MCMConfig'.default.CONFIG_VERSION,class'SuppressionWeaponsRebuilt_MCMListener'.default.CONFIG_VERSION)

static function LazyInitializer()
{
    // Early out.
    if (default.IniFileCreated) 
        return;
    
    // Only works if you correctly labeled the default's version to be >= 1.
    if (class'SuppressionWeaponsRebuilt_MCMConfig'.default.CONFIG_VERSION > class'SuppressionWeaponsRebuilt_MCMListener'.default.CONFIG_VERSION)
    {
        static.UpdateSavedIniFile();
    }
    
    default.IniFileCreated = true;
}

static function UpdateSavedIniFile()
{
    // This updates values or grabs defaults if the INI is missing.
    class'SuppressionWeaponsRebuilt_MCMListener'.default.RIFLE_ENABLED =
        `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.RIFLE_ENABLED,class'SuppressionWeaponsRebuilt_MCMListener'.default.RIFLE_ENABLED);
	class'SuppressionWeaponsRebuilt_MCMListener'.default.BULLPUP_ENABLED =
        `MCM_CH_GetValue(class'SuppressionWeaponsRebuilt_MCMConfig'.default.BULLPUP_ENABLED,class'SuppressionWeaponsRebuilt_MCMListener'.default.BULLPUP_ENABLED);
    
    // This saves updates or creates the INI if it's missing.
    class'SuppressionWeaponsRebuilt_MCMListener'.static.StaticSaveConfig();
}

defaultproperties
{
    IniFileCreated = false;
}