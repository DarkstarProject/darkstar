-----------------------------------	
-- Garland Of Bliss	
-- Staff weapon skill	
-- Skill level: N/A	
-- Lowers target's defense. Duration of effect varies with TP. Nirvana: Aftermath effect varies with TP.	
-- Reduces enemy's defense by 12.5%.	
-- Available only after completing the Unlocking a Myth (Summoner) quest.	
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.	
-- Aligned with the Flame Belt, Light Belt & Aqua Belt.	
-- Element: Light	
-- Modifiers: MND:40%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.00      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2; ftp200 = 2; ftp300 = 2;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.4; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 30) + 30;
		if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
			target:addStatusEffect(EFFECT_DEFENSE_DOWN, 12.5, 0, duration);
		end
	end	
	return tpHits, extraHits, damage;
	
end	
