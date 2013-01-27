-----------------------------------	
-- One Inch Punch	
-- Hand-to-Hand weapon skill	
-- Skill level: 75	
-- Delivers an attack that ignores target's defense. Amount ignored varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget.	
-- Aligned with the Shadow Belt.	
-- Element: None	
-- Modifiers: VIT:40%	
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
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.4; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
		
	--Defense ignored is 0%, 25%, 50% as per wiki.bluegartr.com
	params.ignoresDef = true;
	params.ignored100 = 0;
	params.ignored200 = 0.25;
	params.ignored300 = 0.5;
	
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
		
	return tpHits, extraHits, damage;
	
end	
