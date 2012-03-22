-------------------------------
-- Auth : Thief
-- Skill: Backhand Blow
-- Class: H2H Weapon Skill
-- Level: 100
-- Mods : STR:30% DEX:30%
-- 100%TP 	200%TP 	300%TP
-- 1.0x		1.0x	1.0x
-- Deals critical damage. Chance of crit varies by TP.
-------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	
	--number of normal hits for ws
	numHits = 1;

	--stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	str_mod = 0.3;		dex_mod = 0.3;
	vit_mod = 0.0;		agi_mod = 0.0;
	int_mod = 0.0;		mnd_mod = 0.0;
	chr_mod = 0.0;

	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function fTP)
	ftp100 = 1.0; ftp200 = 1.0; ftp300 = 1.0;

	--critical modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	crit100 = 0.4; crit200=0.6; crit300=0.8;
	canCrit = false;

	--accuracy modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc) Keep 0 if ws doesn't have accuracy modification.
	acc100 = 0.0; acc200=0.0; acc300=0.0;

	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkMulti = 1;

	damage = doPhysicalWeaponskill(attacker,target, numHits, str_mod, dex_mod, vit_mod, agi_mod, int_mod, mnd_mod, chr_mod, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, atkMulti);

	return damage;
end
