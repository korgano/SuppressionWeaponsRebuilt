[h1]WARNING: WOTC only![/h1]

Adds Suppression to weapons based on their weapon category and a config file blacklist.

Replaces [url=http://steamcommunity.com/sharedfiles/filedetails/?id=701134101]Suppression Weapons[/url], which uses specific WeaponTemplate references to add Suppression to weapons. Since new weapon mods keep being added and MCM doesn't have UI features like accordions, supporting it long-term is no longer viable. It remains on Steam Workshop for Legacy support reasons.

[h2]How to use[/h2]
[LIST]
[*] Subscribe to mod.
[*] On game start, open options menu.
[*] Open mod options menu.
[*] Select weapon categories to add Suppression to.
[*] Save settings.
[*] Start/load campaign.
[/LIST]

Suppression is added via OnPostTemplates created. Any changes to settings will [b]ONLY[/b] take effect on campaign start/load.

[h2]Supported Categories[/h2]
[LIST]
[*] Rifles/SMGs.
[*] Bullpups.
[*] SPARK Rifles.
[*] Pistols.
[*] Sidearms.
[*] Shotguns.
[*] Sniper Rifles.
[*] Vektor Rifles.
[/LIST]

[h2]Blacklist[/h2]
Any weapons in the XComWepBlacklist.ini file will [b]NOT[/b] have Suppression applied to them.

To suggest weapons to add to the blacklist, suggest them in the dedicated thread.

Special thanks to:
[LIST]
[*] Iridar and the XCOM 2 Modding Discord for helping out with various programming and technical issues.
[/LIST]

If you like this, check out some of my other mods:
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1123788033]2x Ability Points[/url] - get 2 XCOM AP for tactical actions, to build a bigger AP pool for your soldiers.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1130220766]WOTC: Ranger and Grenadier Rebalanced[/url] - Get Implacable and Suppression as a Squaddie abilities, then an AOE Suppression ability on Grenadiers and a detection radius reduction for Rangers at higher ranks.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1127923760]Exclude Same Class Skills[/url] - avoid rolling your base game class' own skills in the XCOM skill tree.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1127414837]Rapid Fire Reverted[/url] - gets rid of the unmentioned cooldown on the WOTC version of Rapid Fire.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1125677992]Pistols Rebalanced[/url] - feel pistols are too weak to be of value? Try this out! Has experimental support for Primary Pistols.

[h3]Source Code[/h3]
[url]https://github.com/korgano/SuppressionWeaponsRebuilt[/url] - dedicated Github repo for long term support.