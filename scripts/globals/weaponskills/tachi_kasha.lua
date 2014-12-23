-----------------------------------	
-- Tachi Kasha	
-- Great Katana weapon skill	
-- Skill Level: 250	
-- Paralyzes target. Damage varies with TP.	
-- Paralyze effect duration is 60 seconds when unresisted.	
-- In order to obtain Tachi: Kasha, the quest The Potential Within must be completed.	
-- Will stack with Sneak Attack.	
-- Tachi: Kasha appears to have a moderate attack bonus of +50%. [1]	
-- Aligned with the Flame Gorget, Light Gorget & Shadow Gorget.	
-- Aligned with the Flame Belt, Light Belt & Shadow Belt.	
-- Element: None	
-- Modifiers: STR:75%	
-- 100%TP    200%TP    300%TP	
-- 1.56      1.88      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.56; params.ftp200 = 1.88; params.ftp300 = 2.5;
	params.str_wsc = 0.75; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1.5;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
		target:addStatusEffect(EFFECT_PARALYSIS, 25, 0, 60);
	end	
	
	return tpHits, extraHits, criticalHit, damage;
	
end	
