-----------------------------------	
-- Mystic Boon	
-- Club weapon skill	
-- Skill level: N/A	
-- Converts damage dealt to own MP. Damage varies with TP. Yagrush: Aftermath effect varies with TP.	
-- Available only after completing the Unlocking a Myth (White Mage) quest.	
-- Damage is significantly affected by Attack. Verification Needed	
-- Not aligned with any "elemental gorgets" or elemental belts due to it's absence of Skillchain properties.	
-- Element: None	
-- Modifiers: STR:30% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.50      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1.5; ftp300 = 2;
	str_wsc = 0.3; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.5; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
