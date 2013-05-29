-----------------------------------	
-- Blade Kamu	
-- Katana weapon skill	
-- Skill Level: N/A	
-- Lowers target's params.accuracy. Duration of effect varies with TP. Nagi: Aftermath effect varies with TP.	
-- Effect lasts 60 seconds @ 100 TP, 90 seconds @ 200 TP, and 120 seconds @ 300 TP	
-- Available only after completing the Unlocking a Myth (Ninja) quest.	
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.	
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.	
-- Element: None	
-- Modifiers: STR:50% ; INT:50%	
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
	params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.5; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if damage > 0 then	
		local tp = player:getTP();
		local duration = (tp/100 * 30) + 30;
		if(target:hasStatusEffect(EFFECT_ACCURACY_DOWN) == false) then
			target:addStatusEffect(EFFECT_ACCURACY_DOWN, 10, 0, duration);
		end
	end
	return tpHits, extraHits, criticalHit, damage;
	
end	
