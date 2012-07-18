-----------------------------------	
-- Torcleaver
-- Great Sword weapon skill	
-- Skill Level: N/A
-- Deals triple damage. Damage varies with TP. Caladbolg: Aftermath.
-- Available only when equipped with Caladbolg (85)/(90)/(95) or Espafut +1/+2/+3.
-- Aligned with the Light Gorget, Aqua Gorget & Snow Gorget. 	
-- Aligned with the Light Belt, Aqua Belt & Snow Belt.	
-- Element: None
-- Modifiers: VIT:60%
-- 100%TP    200%TP    300%TP	
-- 4.75      5.75      6.5
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 4.75; ftp200 = 5.75; ftp300 = 6.5;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.6; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 3;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
