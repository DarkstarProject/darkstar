-----------------------------------	
-- Randgrith	
-- Club weapon skill	
-- Skill level: N/A	
-- Lowers target's evasion. Gullintani/Mjollnir: Temporarily improves accuracy.	
-- Available only when equipped with the Relic Weapons Gullintani (Dynamis use only), Mjollnir, or a Charged Molva Maul.	
-- Aftermath: Adds +20 accuracy after the weapon skill is used, duration is determined by TP. Only available with Gullintani and Mjollnir.	
-- 100% = 20 seconds, 200% = 40 seconds, 300% = 60 seconds.	
-- This Relic Weapon is only available to White Mages; Scholars must use the Molva Maul to acquire this weapon skill.	
-- Shield Break effect : Evasion -32	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: STR:40% ; MND:40%	
-- 100%TP    200%TP    300%TP	
-- 2.75      2.75      2.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2.75; ftp200 = 2.75; ftp300 = 2.75;
	str_wsc = 0.4; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.4; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	if damage > 0 and (target:hasStatusEffect(EFFECT_WEIGHT) == false) then
		target:addStatusEffect(EFFECT_WEIGHT, 50, 0, 60);
	end
	
	return tpHits, extraHits, damage;
	
end	
