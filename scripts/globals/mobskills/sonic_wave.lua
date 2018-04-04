---------------------------------------------
-- Sonic Wave
-- Reduces defense of enemies in an area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.DEFENSE_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 120));

    return typeEffect;
end;
