-------------------------------
-- Auth : Thief
-- Skill: Tornado Kick
-- Class: H2H Weapon Skill
-- Level: 225
-- Mods : STR:40% VIT:40%
-- 100%TP 	200%TP 	300%TP
-- 2.25      4.25    7.5
-- Delivers a twofold attack. Damage varies with TP.
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	--number of normal hits for ws
	params.numHits = 2;

	--stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	params.str_wsc = 0.4;		params.dex_wsc = 0.0;
	params.vit_wsc = 0.4;		params.agi_wsc = 0.0;
	params.int_wsc = 0.0;		params.mnd_wsc = 0.0;
	params.chr_wsc = 0.0;

	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function ftp)
	params.ftp100 = 2.25; params.ftp200 = 4.25; params.ftp300 = 7.5;

	--critical modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
	params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
	params.canCrit = false;

	--params.accuracy modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc) Keep 0 if ws doesn't have accuracy modification.
	params.acc100 = 0.0; params.acc200=0.0; params.acc300=0.0;

	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	params.atkmulti = 1.5;
	params.kick = false;
	-- Tornado kick is not considered a kick attack and is not modified by Footwork http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6140907&viewfull=1#post6140907

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	return tpHits, extraHits, criticalHit, damage;
end
