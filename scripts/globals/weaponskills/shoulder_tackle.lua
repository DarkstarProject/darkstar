-------------------------------
-- Auth : Thief
-- Skill: Shoulder Tackle
-- Class: H2H Weapon Skill
-- Level: 5
-- Mods : VIT:30%
-- 100%TP 	200%TP 	300%TP
-- 1.0x		1.0x	1.0x
-- Stuns target. Chance of stunning varies with TP.
-------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");
require("/scripts/globals/status");

function OnUseWeaponSkill(attacker, target, wsID)

	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function fTP)
	ftp100 = 1; ftp200 = 1.5; ftp300 = 2;

	chanceMod = fTP(attacker:getTP(), ftp100, ftp200, ftp300)*10;

	stunChance = math.random(0,20+chanceMod);

	if( stunChance > 15 ) then
		target:addStatusEffect(EFFECT_STUN,0,10,2,FLAG_DISPELABLE);
	end

	--number of normal hits for ws (example = Sturmwind)
	numHits = 1;

	--stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	str_mod = 0.0;		dex_mod = 0.0;
	vit_mod = 0.3;		agi_mod = 0.0;
	int_mod = 0.0;		mnd_mod = 0.0;
	chr_mod = 0.0;

	--critical modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	crit100 = 0.0; crit200=0.0; crit300=0.0;
	canCrit = false;

	--accuracy modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc) Keep 0 if ws doesn't have accuracy modification.
	acc100 = 0.0; acc200=0.0; acc300=0.0;

	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkMulti = 1;

	damage = doPhysicalWeaponskill(attacker,target, numHits, str_mod, dex_mod, vit_mod, agi_mod, int_mod, mnd_mod, chr_mod, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, atkMulti);

	return damage;
end
