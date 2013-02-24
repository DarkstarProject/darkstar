---------------------------------------------------
-- Poison Sting
-- Induces poison
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 5, 3, 180));

    return typeEffect;
end;
