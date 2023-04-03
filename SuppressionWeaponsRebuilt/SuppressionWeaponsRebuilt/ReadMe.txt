[h1]WARNING: WOTC only![/h1]

Adds Suppression to weapons based on their weapon category and a config file blacklist.

Replaces [url=http://steamcommunity.com/sharedfiles/filedetails/?id=701134101]Suppression Weapons[/url], which uses specific WeaponTemplate references to add Suppression to weapons. Since new weapon mods keep being added and MCM doesn't have UI features like accordions, supporting it long-term is no longer viable. It remains on Steam Workshop for Legacy support reasons.

If you have WOTCHighlander, you [b]do not[/b] need WOTC Suppression Visualization Fix - it is integrated into the Highlander code.

For use with [url=http://steamcommunity.com/sharedfiles/filedetails/?id=1130220766]WOTC: Ranger and Grenadier Rebalanced[/url], only enable Suppression on cannons if you [b]do not[/b] have access to Suppression as a Grenadier squaddie skill.

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
Any weapons in the XComWepBlacklist.ini file will [b]NOT[/b] have Suppression applied to them. To remove them from the blacklist, add a ; in front of "+Blacklist_Wep=".

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
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1125677992]Pistols Rebalanced[/url] - feel pistols are too weak to be of value? Try this out! Now with expanded mod support.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1124148961]Simple True Concealment[/url] - True Concealment for WOTC, courtesy of simple .ini tweaks.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1101189377]Farscape: The Game Voice Pack[/url] - hear the cast of Farscape as you fight ADVENT.
-[url=http://steamcommunity.com/sharedfiles/filedetails/?id=1121654496]Crysis 2 Music[/url] - Listen to epic score with the Music Modding System. Compatible with vanilla XCOM 2 and WOTC.

[h3]Source Code[/h3]
[url]https://github.com/korgano/SuppressionWeaponsRebuilt[/url] - dedicated Github repo for long term support.