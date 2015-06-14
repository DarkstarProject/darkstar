---------------------------------------------
--  Sound Vacuum
--
--  Description: Silences opponents in a fan-shaped area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Worm version is single target rather than conical (except for Nightmare Worm). The Nightmare Cockatrice inflicts Mute with this ability.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 45));

	return typeEffect;
end;
