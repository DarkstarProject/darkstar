---------------------------------------------
--  Pleiades Ray
--
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local duration = 120;

	MobStatusEffectMove(mob, target, EFFECT_PARALYSIS, 40, 3, duration);
	MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 40, 3, duration);
	MobStatusEffectMove(mob, target, EFFECT_POISON, 10, 3, duration);
	MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 5, 3, duration);
	MobStatusEffectMove(mob, target, EFFECT_BIND, 1, 0, duration);
	MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, duration);
	MobStatusEffectMove(mob, target, EFFECT_SLOW, 128, 0, duration);

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*7,ELE_FIRE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
