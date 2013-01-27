-----------------------------------	
-- Entropy	
-- Scythe weapon skill
-- Skill level: 357
-- Description: Delivers a fourfold attack that converts damage dealt into own MP. Damage varies with TP.
-- In order to obtain Entropy, the quest Martial Mastery must be completed.
-- MP recovery is about 15~25% of damage dealt.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None	
-- Modifiers: INT:20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 0.75      0.84375   0.9375
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 4;
	params.ftp100 = 0.75; params.ftp200 = 0.84; params.ftp300 = 0.94;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.85; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
