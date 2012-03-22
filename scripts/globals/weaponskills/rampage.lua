-----------------------------------
-- Rampage  
-- Axe weapon skill
-- Skill: 175
-- Modifiers: STR:30% - 5hit, crit varies
-- 100%TP 	200%TP 	300%TP
-- 0.5		0.5		0.5
-----------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");
function OnUseWeaponSkill(attacker, target, wsID)
	numHits = 5;
	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function
	ftp100 = 0.5; ftp200 = 0.5; ftp300 = 0.5;
	--wscs are in % so 0.2=20%
	str_wsc = 0.3; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	--critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
	crit100 = 0.1; crit200=0.3; crit300=0.5;
	canCrit = true;
	--accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
	acc100 = 0.0; acc200=0.0; acc300=0.0;
	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkmulti = 1;
	
	damage = doPhysicalWeaponskill(attacker,target, numHits,  str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,  canCrit,crit100,crit200,crit300,  acc100,acc200,acc300,   atkmulti);
	
	return damage;
end
