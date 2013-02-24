---------------------------------------------------
-- Slumber Powder
-- 10' Conal sleep
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLEEP_I;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 30));

    return typeEffect;
end;
