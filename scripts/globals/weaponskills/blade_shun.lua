-----------------------------------     
-- Blade Shun
-- Katana weapon skill  
-- Skill level: N/A
-- Description: Delivers a fivefold attack. Attack power varies with TP.
-- In order to obtain Blade: Shun the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits.
-- Alignet with the Flame Gorget, Light Gorget & Thunder Gorget.
-- Alignet with the Flame Belt, Light Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Fusion/Impaction
-- Modifiers: DEX:20~100%, depending on merit points ugrades.
-- Damage Multipliers by TP:
-- 100%	    200%	  300%
-- 0.6875	0.6875	  0.6875
-----------------------------------        
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
	
	local params = {};
	params.numHits = 5;
	params.ftp100 = 0.6875; params.ftp200 = 0.6875; params.ftp300 = 0.6875;
	params.str_wsc = 0.0; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);        
	return tpHits, extraHits, criticalHit, damage;
	
end     