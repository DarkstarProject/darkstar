-----------------------------------	
-- Omniscience	
-- Staff weapon skill	
-- Skill Level: N/A	
-- Lowers target's magic attack. Duration of effect varies with TP. Tupsimati: Aftermath effect varies with TP.	
-- Reduces enemy's magic attack by -10.	
-- Available only after completing the Unlocking a Myth (Scholar) quest.	
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.	
-- Element: Dark	
-- Modifiers: MND:30%	
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
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100);
		if(target:hasStatusEffect(EFFECT_MAGIC_ATK_DOWN) == false) then
			target:addStatusEffect(EFFECT_MAGIC_ATK_DOWN, 10, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
