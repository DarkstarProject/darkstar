---------------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLOW;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 128, 0, 120));
    return typeEffect;
end;
