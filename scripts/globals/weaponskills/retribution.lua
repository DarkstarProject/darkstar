-----------------------------------	
-- Retribution	
-- Staff weapon skill	
-- Skill Level: 230	
-- Delivers a single-hit attack. Damage varies with TP.	
-- In order to obtain Retribution, the quest Blood and Glory must be completed.	
-- Despite the appearance of throwing the staff, this is not a long-range Weapon Skill like Mistral Axe.	
-- The range only extends the usual 1 yalm beyond meleeing range.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.	
-- Element: None	
-- Modifiers: STR:30% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.50      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2; ftp200 = 2.5; ftp300 = 3;
	str_wsc = 0.3; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.5; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
