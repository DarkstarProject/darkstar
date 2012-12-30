-----------------------------------	
-- Blade Metsu	
-- Katana weapon skill	
-- Skill Level: N/A	
-- Additional effect: Paralysis	
-- Hidden effect: temporarily enhances Subtle Blow effect.	
-- One hit weapon skill, despite non single-hit animation.	
-- This weapon skill is only available with the stage 5 relic Katana Kikoku or within Dynamis with the stage 4 Yoshimitsu.	
-- Weaponskill is also available with the Sekirei Katana obtained from Abyssea NM Sedna.	
-- Aligned with the Shadow Gorget, Breeze Gorget & Thunder Gorget.	
-- Aligned with the Shadow Belt, Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: DEX:60%	
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
	params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if damage > 0 then	
		tp = player:getTP();
		duration = (tp/100 * 20);
		if(target:hasStatusEffect(290) == false) then
			player:addStatusEffect(290, 10, 0, duration);
		end
	end
	return tpHits, extraHits, damage;
	
end	
