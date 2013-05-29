-----------------------------------	
-- Split Shot	
-- Marksmanship weapon skill	
-- Skill Level: 40	
-- Ignores enemy's defense. Amount ignored varies with TP.	
-- The amount of defense ignored is 0% @ 100TP, 35% @ 200TP and 50% @ 300TP.	
-- Aligned with the Aqua Gorget & Light Gorget.	
-- Aligned with the Aqua Belt & Light Belt.	
-- Element: None	
-- Modifiers: AGI:30%	
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
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.3; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
		
	local tp = player:getTP(); --why is this here? it doesn't seem to be being used...
	
	--Defense ignored is 0%, 35%, 50% as per wiki.bluegartr.com
	params.ignoresDef = true;
	params.ignored100 = 0;
	params.ignored200 = 0.35;
	params.ignored300 = 0.5;
	
	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
		
	return tpHits, extraHits, criticalHit, damage;
	
end	
