-------------------------------
-- Auth : Thief
-- Skill: Dragon Kick
-- Class: H2H Weapon Skill
-- Level: 225
-- Mods : STR:37.5% VIT:30%
-- 100%TP 	200%TP 	300%TP
-- 2.0x		2.75x	3.5x
-- Delivers a twofold attack. Damage varies with TP.
-------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	
	--number of normal hits for ws
	numHits = 2;

	--stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	str_mod = 0.5;		dex_mod = 0.0;
	vit_mod = 0.5;		agi_mod = 0.0;
	int_mod = 0.0;		mnd_mod = 0.0;
	chr_mod = 0.0;

	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function fTP)
	ftp100 = 2.0; ftp200 = 2.75; ftp300 = 3.5;

	--critical modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	crit100 = 0.0; crit200=0.0; crit300=0.0;
	canCrit = false;

	--accuracy modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc) Keep 0 if ws doesn't have accuracy modification.
	acc100 = 0.0; acc200=0.0; acc300=0.0;

	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkMulti = 1;

	damage = doPhysicalWeaponskill(attacker,target, numHits, str_mod, dex_mod, vit_mod, agi_mod, int_mod, mnd_mod, chr_mod, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, atkMulti);

	if( attacker:hasStatusEffect(EFFECT_FOOTWORK) == true) then
		damage += 18;
	end

	if( player:getEquipID(8) == 14128 ) then
		damage += 25;
	end

	damage = damage * fTP(attacker:getTP(), ftp100, ftp200, ftp300);

	return damage;
end
