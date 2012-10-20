-----------------------------------	
-- Bora Axe	
-- Axe weapon skill
-- Skill level: 290
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Chance of binding varies with TP
-- Bind doesn't always break from hitting mob. 
-- This Weapon Skill's first hit fTP is duplicated for all additional hits
-- Not natively available to RNG 
-- Aligned with the ?? Gorget. 
-- Element: Ice	
-- Modifiers: DEX 60%  --http://wiki.bluegartr.com/bg/Bora_Axe
-- 100%TP    200%TP    300%TP	
-- 1.0        1.0      1.0

-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1.0; ftp200 = 1.0; ftp300 = 1.0;
	str_wsc = 0.0; dex_wsc = 0.6; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 3.5;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	if damage > 0 and (target:hasStatusEffect(EFFECT_BIND) == false) then
		target:addStatusEffect(EFFECT_BIND, 1, 0, 20);
	end

	return tpHits, extraHits, damage;
	
end	
