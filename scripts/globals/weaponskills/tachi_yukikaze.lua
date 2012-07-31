-----------------------------------	
-- Tachi Yukikaze	
-- Great Katana weapon skill	
-- Skill Level: 200 (Samurai only.)	
-- Blinds target. Damage varies with TP.	
-- Blind effect duration is 60 seconds when unresisted.	
-- Will stack with Sneak Attack.	
-- Tachi: Yukikaze appears to have an attack bonus of 33%. [1]	
-- Aligned with the Snow Gorget & Breeze Gorget.	
-- Aligned with the Snow Belt & Breeze Belt.	
-- Contents	
-- 1 Properties	
-- 2 Translation	
-- 3 Levels	
-- 4 References	
-- Element: None	
-- Modifiers: STR:75%	
-- 100%TP    200%TP    300%TP	
-- 1.56      1.88      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1.56; ftp200 = 1.88; ftp300 = 2.5;
	str_wsc = 0.75; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1.33;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);

	if damage > 0 then
		target:addStatusEffect(EFFECT_BLINDNESS, 25, 0, 60);
	end	
	
	return tpHits, extraHits, damage;
	
end	
