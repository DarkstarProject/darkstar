-----------------------------------     
-- Ukko's Fury
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a twofold attack that slows target. Chance of params.critical hit varies with TP. Ukonvasara: Aftermath.
-- Available only when equipped with Ukonvasara (85), Ukonvasara (90), Ukonvasara (95), Maschu +1, Maschu +2.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light/Fragmentation
-- Modifiers: STR:60%
-- Damage Multipliers by TP:
-- 100%TP	200%TP	300%TP
-- 2.0		2.0		2.0
-- params.critical Chance added with TP:
-- 100%TP	200%TP	300%TP
-- 20%		35%		55%
--
-----------------------------------        
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 2; params.ftp200 = 2; params.ftp300 = 2;
	params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.20; params.crit200 = 0.35; params.crit300 = 0.55;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);        
		
	if damage > 0 and (target:hasStatusEffect(EFFECT_SLOW) == false) then
		target:addStatusEffect(EFFECT_SLOW, 15, 0, 60);
	end			
		
	return tpHits, extraHits, damage;
end     