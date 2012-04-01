-----------------------------------	
-- Dragon Kick	
-- Hand-to-Hand weapon skill	
-- Skill Level: 225	
-- Damage varies with TP.	
-- Dragon Kick will only be affected by equipment that increases Kick Attacks damage such as Kung Fu Shoes under the effect of Footwork.	
-- Will stack with Sneak Attack.	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: STR:50% ; VIT:50%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.75      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 2;
	ftp100 = 2; ftp200 = 2.75; ftp300 = 3.5;
	str_wsc = 0.5; dex_wsc = 0.0; vit_wsc = 0.5; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
