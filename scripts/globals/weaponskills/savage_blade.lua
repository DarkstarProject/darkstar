-----------------------------------	
-- Savage Blade	
-- Sword weapon skill	
-- Skill Level: 240	
-- Delivers a twofold attack. Damage varies with TP.	
-- In order to obtain Savage Blade, the quest Old Wounds must be completed.	
-- Will stack with Sneak Attack.	
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget	
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.	
-- Element: None	
-- Modifiers: STR:30% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.75      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 1; params.ftp200 = 1.75; params.ftp300 = 3.5;
	params.bonusacc = 0;
	if ((player:getEquipID(SLOT_NECK) == 15497) or (player:getEquipID(SLOT_NECK) == 15499) or (player:getEquipID(SLOT_NECK) == 15498)) then
	    params.ftp100 = params.ftp100 + 0.1;
	    params.ftp200 = params.ftp200 + 0.1;
	    params.ftp300 = params.ftp300 + 0.1;
	    params.bonusacc = params.bonusacc + 10;
	end
	if ((player:getEquipID(SLOT_WAIST) == 11757) or (player:getEquipID(SLOT_WAIST) == 11759) or (player:getEquipID(SLOT_WAIST) == 11758)) then
	    params.ftp100 = params.ftp100 + 0.1;
	    params.ftp200 = params.ftp200 + 0.1;
	    params.ftp300 = params.ftp300 + 0.1;
	    params.bonusacc = params.bonusacc + 10;
	end
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, criticalHit, damage;
	
end	
