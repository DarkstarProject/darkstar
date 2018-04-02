---------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.SLOW;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 128, 0, 120));
    return typeEffect;
end;
