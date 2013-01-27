-----------------------------------	
-- Garland Of Bliss	
-- Staff weapon skill	
-- Skill level: N/A	
-- Lowers target's defense. Duration of effect varies with TP. Nirvana: Aftermath effect varies with TP.	
-- Reduces enemy's defense by 12.5%.	
-- Available only after completing the Unlocking a Myth (Summoner) quest.	
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.	
-- Aligned with the Flame Belt, Light Belt & Aqua Belt.	
-- Element: Light	
-- Modifiers: MND:40%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.00      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 2; params.ftp200 = 2; params.ftp300 = 2;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.4; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 30) + 30;
		if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
			target:addStatusEffect(EFFECT_DEFENSE_DOWN, 12.5, 0, duration);
		end
	end	
	return tpHits, extraHits, damage;
	
end	
