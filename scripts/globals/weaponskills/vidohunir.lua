-----------------------------------	
-- Vidohunir	
-- Staff weapon skill	
-- Skill Level: N/A	
-- Lowers target's magic defense. Duration of effect varies with TP. Laevateinn: Aftermath effect varies with TP.	
-- Reduces enemy's magic defense by 10%.	
-- Available only after completing the Unlocking a Myth (Black Mage) quest.	
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.	
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.	
-- Element: Darkness	
-- Modifiers: INT:30%	
-- 100%TP    200%TP    300%TP	
-- 1.75      1.75      1.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1.75; ftp200 = 1.75; ftp300 = 1.75;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.3; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 60);
		target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 10, 0, duration);
	end		
	
	return tpHits, extraHits, damage;
	
end	
