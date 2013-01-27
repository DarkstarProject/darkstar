-----------------------------------     
-- Rudra's Storm
-- Dagger weapon skill  
-- Skill level: N/A
-- Deals triple damage and weighs target down (duration: 60s). Damage varies with TP.
-- Aligned with the Aqua Gorget, Snow Gorget & Shadow Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Shadow Belt.       
-- Element: None        
-- Modifiers: DEX:60% 
-- 100%TP    200%TP    300%TP   
-- 3.25      4.25      5.25     
-----------------------------------     
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     

function OnUseWeaponSkill(player, target, wsID) 
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 3.25; params.ftp200 = 4.25; params.ftp300 = 5.25;
	params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	return tpHits, extraHits, damage;
	
end     