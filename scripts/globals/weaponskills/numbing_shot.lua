-----------------------------------  
-- Numbing Shot
-- Marksmanship weapon skill  
-- Skill level: 290
-- Main of sub must be Ranger or Corsair
-- Aligned with the Thunder & Breeze Gorget.  
-- Aligned with the Thunder Belt & Breeze Belt.  
-- Element: Ice
-- Modifiers: STR 30% MND 25%
-- 100%TP    200%TP    300%TP  
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------
	
function OnUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.25; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
	if damage > 0 then
			tp = player:getTP();
			duration = (tp/100 * 30) + 60;
			if(target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
					-- paralyze proc based on lvl difference
					local power = 20 + (player:getMainLvl() - target:getMainLvl())*3;

					if(power > 30) then
							power = 30;
					end
					if(power < 5) then
							power = 5;
					end
					target:addStatusEffect(EFFECT_PARALYSIS, power, 0, duration);
			end
	end
   
	return tpHits, extraHits, damage;
   
end
