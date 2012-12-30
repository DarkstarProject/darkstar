-----------------------------------	
-- Black Halo	
-- Club weapon skill	
-- Skill level: 230	
-- In order to obtain Black Halo, the quest Orastery Woes must be completed.	
-- Delivers a two-hit attack. Damage varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.	
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.	
-- Element: None	
-- Modifiers: STR:30% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 1.50      2.50      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 3;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
