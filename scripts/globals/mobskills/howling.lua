---------------------------------------------
-- Howling
--
-- Description: Paralyzes enemies in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.PARALYSIS;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 60));

    return typeEffect;
end;
