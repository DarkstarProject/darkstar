-----------------------------------	
-- Tachi Rana	
-- Great Katana weapon skill	
-- Skill Level: N/A	
-- Delivers a three-fold attack. Accuracy varies with TP. Aftermath effect varies with TP. See Kogarasumaru.	
-- In order to obtain Tachi: Rana, the Unlocking a Myth (Samurai) quest must be completed.	
-- Will stack with Sneak Attack (first hit only).	
-- Aligned with the Shadow Gorget, Soil Gorget & Snow Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Snow Belt.	
-- Element: None	
-- Modifiers: STR:35%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 3;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.35; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
