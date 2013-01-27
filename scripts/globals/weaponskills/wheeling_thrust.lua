-----------------------------------	
-- Wheeling Thrust	
-- Polearm weapon skill	
-- Skill Level: 225	
-- Ignores enemy's defense. Amount ignored varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Flame Gorget & Light Gorget.	
-- Aligned with the Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:50%	
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
	params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	
	local tp = player:getTP();--why is this here? it doesn't seem to be used...
	
	--Defense ignored is 50%, 75%, 100% (guessed)
	params.ignoredDef = true;
	params.ignored100 = 0.5;
	params.ignored200 = 0.75;
	params.ignored300 = 1;
	
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
end	
