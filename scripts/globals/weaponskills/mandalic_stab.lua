-----------------------------------	
-- Mandalic Stab	
-- Dagger weapon skill	
-- Skill Level: N/A	
-- Damage Varies with TP. Vajra: Aftermath effect varies with TP.	
-- Multiplies attack by 1.66	
-- Available only after completing the Unlocking a Myth (Thief) quest.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget, Flame Gorget & Light Gorget.	
-- Aligned with the Shadow Belt, Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: DEX:30%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.13      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2; ftp200 = 2.13; ftp300 = 2.5;
	str_wsc = 0.0; dex_wsc = 0.3; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1.66;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
