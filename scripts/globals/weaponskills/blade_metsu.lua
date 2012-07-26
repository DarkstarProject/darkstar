-----------------------------------	
-- Blade Metsu	
-- Katana weapon skill	
-- Skill Level: N/A	
-- Additional effect: Paralysis	
-- Hidden effect: temporarily enhances Subtle Blow effect.	
-- One hit weapon skill, despite non single-hit animation.	
-- This weapon skill is only available with the stage 5 relic Katana Kikoku or within Dynamis with the stage 4 Yoshimitsu.	
-- Weaponskill is also available with the Sekirei Katana obtained from Abyssea NM Sedna.	
-- Aligned with the Shadow Gorget, Breeze Gorget & Thunder Gorget.	
-- Aligned with the Shadow Belt, Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: DEX:60%	
-- 100%TP    200%TP    300%TP	
-- 3.00      3.00      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 3; ftp200 = 3; ftp300 = 3;
	str_wsc = 0.0; dex_wsc = 0.6; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
