-----------------------------------	
-- Stardiver
-- Polearm weapon skill	
-- Skill Level: MERIT	
-- Delivers a fourfold attack. Damage varies with TP.	
-- Will stack with Sneak Attack.	 reduces params.crit hit evasion by 5%
-- Element: None	
-- Modifiers: STR:85% //actually 17~85%
-- 100%TP    200%TP    300%TP	
-- 0.75	     0.84375	0.9375	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 4;
	params.ftp100 = 0.75; params.ftp200 = 0.84375; params.ftp300 = 0.9375;
	params.str_wsc = 0.85; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	if damage > 0 and (target:hasStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN) == false) then
		target:addStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN, 5, 0, 60);
	end		
	
	return tpHits, extraHits, damage;
	
end	
