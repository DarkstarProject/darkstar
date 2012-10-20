-----------------------------------	
-- Stardiver
-- Polearm weapon skill	
-- Skill Level: MERIT	
-- Delivers a fourfold attack. Damage varies with TP.	
-- Will stack with Sneak Attack.	 reduces crit hit evasion by 5%
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
	
	numHits = 4;
	ftp100 = 0.75; ftp200 = 0.84375; ftp300 = 0.9375;
	str_wsc = 0.85; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	if damage > 0 and (target:hasStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN) == false) then
		target:addStatusEffect(EFFECT_CRIT_HIT_EVASION_DOWN, 5, 0, 60);
	end		
	
	return tpHits, extraHits, damage;
	
end	
