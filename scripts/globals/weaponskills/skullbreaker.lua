-----------------------------------	
-- Skullbreaker	
-- Club weapon skill	
-- Skill level: 150	
-- Lowers enemy's INT. Chance of lowering INT varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Snow Gorget & Aqua Gorget.	
-- Aligned with the Snow Belt & Aqua Belt.	
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
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.35; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_INT_DOWN) == false) then
		target:addStatusEffect(EFFECT_INT_DOWN, 10, 0, 140);
	end	
	
	return tpHits, extraHits, damage;
	
end	
