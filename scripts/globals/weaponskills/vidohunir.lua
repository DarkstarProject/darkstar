-----------------------------------	
-- Vidohunir	
-- Staff weapon skill	
-- Skill Level: N/A	
-- Lowers target's magic defense. Duration of effect varies with TP. Laevateinn: Aftermath effect varies with TP.	
-- Reduces enemy's magic defense by 10%.	
-- Available only after completing the Unlocking a Myth (Black Mage) quest.	
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.	
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.	
-- Element: Darkness	
-- Modifiers: INT:30%	
-- 100%TP    200%TP    300%TP	
-- 1.75      1.75      1.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.75; params.ftp200 = 1.75; params.ftp300 = 1.75;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 60);
		if(target:hasStatusEffect(EFFECT_MAGIC_DEF_DOWN) == false) then
			target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 10, 0, duration);
		end
	end		
	
	return tpHits, extraHits, damage;
	
end	
