---------------------------------------------------
-- Awful Ere
-- 15' Reduces STR of players in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STR_DOWN;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 33, 0, 120));
    return typeEffect;
end;
