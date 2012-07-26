-----------------------------------	
-- Piercing Arrow	
-- Archery weapon skill	
-- Skill level: 40	
-- Ignores enemy's defense. Amount ignored varies with TP.	
-- The amount of defense ignored is 0% with 100TP, 35% with 200TP and 50% with 300TP.	
-- Typically does less damage than Flaming Arrow.	
-- Aligned with the Snow Gorget & Light Gorget.	
-- Aligned with the Snow Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:16% ; AGI:25%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.16; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.25; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doRangedWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
