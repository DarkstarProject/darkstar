-----------------------------------	
-- Herculean Slash
-- Great Sword weapon skill	
-- Skill Level: 290
-- Paralyzes target. Duration of effect varies with TP.	
-- Aligned with the Snow Gorget, Thunder Gorget & Breeze Gorget. 	
-- Aligned with the Snow Belt, Thunder Belt & Breeze Belt. 	
-- Element: Ice	
-- Modifiers: VIT:60%
-- As this is a magic-based weaponskill it is also modified by Magic Attack Bonus.
-- 100%TP    200%TP    300%TP	
-- 3.50      3.50      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 3.5; params.ftp200 = 3.5; params.ftp300 = 3.5;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.6; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 60)
		if(target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
			target:addStatusEffect(EFFECT_PARALYSIS, 30, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
