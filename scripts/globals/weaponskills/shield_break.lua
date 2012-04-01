-----------------------------------	
-- Shield Break	
-- Great Axe weapon skill	
-- Skill level: 5	
-- Lowers enemy's Evasion. Duration of effect varies with TP.	
-- Lowers Evasion by as much as 40 if unresisted.	
-- Strong against: Bees, Beetles, Birds, Crabs, Crawlers, Flies, Lizards, Mandragora, Opo-opo, Pugils, Sabotenders, Scorpions, Sea Monks, Spiders, Tonberry, Yagudo.	
-- Immune: Bombs, Gigas, Ghosts, Sheep, Skeletons, Tigers.	
-- Will stack with Sneak Attack.	
-- Aligned with the Thunder Gorget.	
-- Aligned with the Thunder Belt.	
-- Element: Ice	
-- Modifiers: STR:20% ; VIT:20%	
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
	str_wsc = 0.2; dex_wsc = 0.0; vit_wsc = 0.2; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
