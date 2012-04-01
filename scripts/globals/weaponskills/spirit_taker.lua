-----------------------------------	
-- Spirit Taker	
-- Staff weapon skill	
-- Skill Level: 215	
-- Converts damage dealt to own MP. Damage varies with TP.	
-- Will stack with Sneak Attack.	
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.	
-- It is a physical weapon skill, and is affected by the user's accuracy and the enemy's evasion. It may miss completely.	
-- Element: None	
-- Modifiers: INT:50% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.50      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1.5; ftp300 = 2;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.5; mnd_wsc = 0.5; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
