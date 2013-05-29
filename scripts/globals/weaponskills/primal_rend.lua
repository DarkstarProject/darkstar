-----------------------------------	
-- Primal Rend	
-- Axe weapon skill	
-- Skill Level: N/A	
-- Deals light elemental damage. Damage varies with TP. Aymur: Aftermath effect varies with TP.	
-- Available only after completing the Unlocking a Myth (Beastmaster) quest.	
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.	
-- Element: Light	
-- Modifiers: CHR:30%	
-- 100%TP    200%TP    300%TP	
-- 4.00      4.25      4.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 4; params.ftp200 = 4.25; params.ftp300 = 4.75;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.3;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, criticalHit, damage;
	
end	
