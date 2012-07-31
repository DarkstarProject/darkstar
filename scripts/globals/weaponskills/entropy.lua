-----------------------------------	
-- Entropy	
-- Scythe weapon skill
-- Skill level: 357
-- Description: Delivers a fourfold attack that converts damage dealt into own MP. Damage varies with TP.
-- In order to obtain Entropy, the quest Martial Mastery must be completed.
-- MP recovery is about 15~25% of damage dealt.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None	
-- Modifiers: INT:20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 0.75      0.84375   0.9375
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 4;
	ftp100 = 0.75; ftp200 = 0.84; ftp300 = 0.94;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.85; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
