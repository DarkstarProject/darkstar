-----------------------------------	
-- Tachi Yukikaze	
-- Great Katana weapon skill	
-- Skill Level: 200 (Samurai only.)	
-- Blinds target. Damage varies with TP.	
-- Blind effect duration is 60 seconds when unresisted.	
-- Will stack with Sneak Attack.	
-- Tachi: Yukikaze appears to have an attack bonus of 33%. [1]	
-- Aligned with the Snow Gorget & Breeze Gorget.	
-- Aligned with the Snow Belt & Breeze Belt.	
-- Contents	
-- 1 Properties	
-- 2 Translation	
-- 3 Levels	
-- 4 References	
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
	params.atkmulti = 1.33;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_BLINDNESS) == false) then
		target:addStatusEffect(EFFECT_BLINDNESS, 25, 0, 60);
	end	
	
	return tpHits, extraHits, damage;
	
end	
