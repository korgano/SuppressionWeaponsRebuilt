//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_SuppressionWeaponsRebuilt.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_SuppressionWeaponsRebuilt extends X2DownloadableContentInfo;

var config(WepBlacklist) array<name> Blacklist_Wep;
var config(SuppressionWeaponsRebuilt_MCMConfig) bool bLog;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

static event OnPostTemplatesCreated()
{//first entry is the weapon category you want to add an ability to

	//base game guns
	if (class'SuppressionWeaponsRebuilt_MCMListener'.default.RIFLE_ENABLED)
{
    AddAbilities('rifle');
	`log("Suppression Weapons Rebuilt - Base game rifles have Suppression!");
}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on rifles & SMGs disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.BULLPUP_ENABLED)
{
    AddAbilities('bullpup');
	`log("Suppression Weapons Rebuilt - Skirmisher Bullpups have Suppression!");
}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Skirmisher Bullpups disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SPARK_ENABLED)
{
    AddAbilities('sparkrifle');
	`log("Suppression Weapons Rebuilt - SPARK rifles have Suppression!");
}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on SPARK rifles disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.PISTOL_ENABLED)
	{
	AddAbilities('pistol');
	`log("Suppression Weapons Rebuilt - Pistol category has Suppression!");
	}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Pistol category disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SIDEARM_ENABLED)
{
    AddAbilities('sidearm');
	`log("Suppression Weapons Rebuilt - Sidearms have Suppression!");
}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Tenplar Sidearms disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SHOTGUN_ENABLED)
{
    AddAbilities('shotgun');
	`log("Suppression Weapons Rebuilt - Shotguns have Suppression!");
}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Tenplar Sidearms disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.CANNON_ENABLED)
	{
		AddAbilities('cannon');
		`log("Suppression Weapons Rebuilt - Cannons have Suppression!");
	}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Cannons disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SNIPER_ENABLED)
	{
		AddAbilities('sniper_rifle');
		`log("Suppression Weapons Rebuilt - Sniper Rifles have Suppression!");
	}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Sniper Rifles disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.VEKTOR_ENABLED)
	{
		AddAbilities('vektor_rifle');
		`log("Suppression Weapons Rebuilt - Vektor Rifles have Suppression!");
	}
else
{
    `log("Suppression Weapons Rebuilt - Suppression on Vektor Rifles disabled.");
}

	//if you enter stuff that doesnt exists (i.e. ruler autopsies in builds that dont have the dlc) nothing happens, so compatibility should be assured
	AddAbilities('blablabla');
}

/// Modify Weapons by Category
/// ver 1
static function AddAbilities(name WeaponCat)
{
	local X2ItemTemplateManager		ItemTemplateMgr;
    local X2WeaponTemplate			WeaponTemplate;
    local array<X2DataTemplate>		DifficultyVariants;
    local X2DataTemplate			DifficultyVariant;
    local X2DataTemplate			DataTemplate;

    ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    foreach ItemTemplateMgr.IterateTemplates(DataTemplate)
    {   
		if(default.Blacklist_Wep.Find(DataTemplate.DataName) != INDEX_NONE)
			continue;
			`log("Suppression Weapons Rebuilt - Blacklist step passed.", default.bLog);
		
        ItemTemplateMgr.FindDataTemplateAllDifficulties(DataTemplate.DataName, DifficultyVariants);

        foreach DifficultyVariants(DifficultyVariant)
        {
            WeaponTemplate = X2WeaponTemplate(DifficultyVariant);

            if (WeaponTemplate == none || WeaponTemplate.WeaponCat != WeaponCat)
				continue;
				`log("Suppression Weapons Rebuilt - Check category passed.", default.bLog);
				
			if (WeaponTemplate.Abilities.Find('Suppression') == INDEX_NONE)
			{	
				WeaponTemplate.Abilities.AddItem('Suppression');
			}
        }
    }
}