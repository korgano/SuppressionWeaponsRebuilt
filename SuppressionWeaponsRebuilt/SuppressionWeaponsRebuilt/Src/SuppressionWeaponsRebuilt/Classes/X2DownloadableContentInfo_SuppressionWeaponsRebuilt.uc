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

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	/*if (class'SuppressionWeaponsRebuilt_MCMListener'.default.NAME_ENABLED == true)
	{
	local array<X2WeaponTemplate> arrWeaponTemplates;
	local X2DataTemplate Template;
	local X2WeaponTemplate WeaponTemplate;

	foreach IterateTemplates(Template, none)
	{
		WeaponTemplate = X2WeaponTemplate(Template);

		if(WeaponTemplate != none)
		{
			arrWeaponTemplates.AddItem(WeaponTemplate);
			`LOG(`ShowVar(BaseTemplateName),, 'X2WeaponTemplate');
		}
	}

	return arrWeaponTemplates;
	}*/
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

static event OnPostTemplatesCreated()
{//first entry is the weapon category you want to add an ability to, second entry is the ability to add

	//base game guns
	if (class'SuppressionWeaponsRebuilt_MCMListener'.default.RIFLE_ENABLED == true)
{
    AddAbilities('rifle');
	`log("Base game rifles have Suppression!");
}
else
{
    `log("Suppression on rifles & SMGs disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.BULLPUP_ENABLED == true)
{
    AddAbilities('bullpup');
	`log("Skirmisher Bullpups have Suppression!");
}
else
{
    `log("Suppression on Skirmisher Bullpups disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SPARK_ENABLED == true)
{
    AddAbilities('sparkrifle');
	`log("SPARK rifles have Suppression!");
}
else
{
    `log("Suppression on SPARK rifles disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.PISTOL_ENABLED == true)
	{
	AddAbilities('pistol');
	`log("Pistol category has Suppression!");
	}
else
{
    `log("Suppression on Pistol category disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SIDEARM_ENABLED == true)
{
    AddAbilities('sidearm');
	`log("Sidearms have Suppression!");
}
else
{
    `log("Suppression on Tenplar Sidearms disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SHOTGUN_ENABLED == true)
{
    AddAbilities('shotgun');
	`log("Shotguns have Suppression!");
}
else
{
    `log("Suppression on Tenplar Sidearms disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.CANNON_ENABLED == true)
	{
		AddAbilities('cannon');
		`log("Cannons have Suppression!");
	}
else
{
    `log("Suppression on Cannons disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.SNIPER_ENABLED == true)
	{
		AddAbilities('sniper_rifle');
		`log("Sniper Rifles have Suppression!");
	}
else
{
    `log("Suppression on Sniper Rifles disabled.");
}

if (class'SuppressionWeaponsRebuilt_MCMListener'.default.VEKTOR_ENABLED == true)
	{
		AddAbilities('vektor_rifle');
		`log("Vektor Rifles have Suppression!");
	}
else
{
    `log("Suppression on Vektor Rifles disabled.");
}

	//if you enter stuff that doesnt exists (i.e. ruler autopsies in builds that dont have the dlc) nothing happens, so compatibility should be assured
	AddAbilities('blablabla');
}

/// Modify Weapons by Category
/// ver 1
static function AddAbilities(Name WeaponCat)
{
	local X2ItemTemplateManager		ItemTemplateMgr;
    local X2WeaponTemplate			WeaponTemplate;
    local array<X2DataTemplate>		DifficultyVariants;
    local X2DataTemplate			DifficultyVariant;
    local X2DataTemplate			DataTemplate;

    ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    foreach ItemTemplateMgr.IterateTemplates(DataTemplate, none)
    {   
		if(default.Blacklist_Wep.Find(DataTemplate.DataName) != none)
			continue;
		
        ItemTemplateMgr.FindDataTemplateAllDifficulties(DataTemplate.DataName, DifficultyVariants);

        foreach DifficultyVariants(DifficultyVariant)
        {
            WeaponTemplate = X2WeaponTemplate(DifficultyVariant);

            if (WeaponTemplate !== none)
				continue;
				
			if (WeaponTemplate.Abilities.Find('Suppression') == INDEX_NONE)
			{	
				WeaponTemplate.Abilities.AddItem('Suppression');
			}
        }
    }
}