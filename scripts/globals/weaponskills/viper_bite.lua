-----------------------------------	
-- Viper Bite	
-- Dagger weapon skill	
-- Skill level: 100	
-- Deals double damage and Poisons target. Duration of poison varies with TP.	
-- Doubles attack and not damage.	
-- Despite the animation showing two swings, this is a single-hit weapon skill.	
-- Will stack with Sneak Attack.	
-- Aligned with the Soil Gorget.	
-- Aligned with the Soil Belt.	
-- Element: None	
-- Modifiers: :	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 2;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);

	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 60) + 30;
		if(target:hasStatusEffect(EFFECT_POISON) == false) then
			target:addStatusEffect(EFFECT_POISON, 3, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
