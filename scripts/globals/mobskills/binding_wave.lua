---------------------------------------------
-- Binding Wave
-- Additional effect: bind
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.BIND;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));

    return typeEffect;
end;
