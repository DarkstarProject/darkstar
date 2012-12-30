-----------------------------------	
-- Tachi Gekko	
-- Great Katana weapon skill	
-- Skill Level: 225	
-- Silences target. Damage varies with TP.	
-- Silence effect duration is 60 seconds when unresisted.	
-- Will stack with Sneak Attack.	
-- Tachi: Gekko has a high attack bonus of +100%. [1]	
-- Aligned with the Aqua Gorget & Snow Gorget.	
-- Aligned with the Aqua Belt & Snow Belt.	
-- Element: None	
-- Modifiers: STR:75%	
-- 100%TP    200%TP    300%TP	
-- 1.56      1.88      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.56; params.ftp200 = 1.88; params.ftp300 = 2.5;
	params.str_wsc = 0.75; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 2;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_SILENCE) == false) then
		target:addStatusEffect(EFFECT_SILENCE, 1, 0, 60);
	end		
	
	return tpHits, extraHits, damage;
	
end	
