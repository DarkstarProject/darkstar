-----------------------------------	
-- Dragon Kick	
-- Hand-to-Hand weapon skill	
-- Skill Level: 225	
-- Damage varies with TP.	
-- Dragon Kick will only be affected by equipment that increases Kick Attacks damage such as Kung Fu Shoes under the effect of Footwork.	
-- Will stack with Sneak Attack.	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: STR:50% ; VIT:50%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.75      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 2; params.ftp200 = 2.75; params.ftp300 = 3.5;
	params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.5; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
