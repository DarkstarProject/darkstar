---------------------------------------------------
-- Poison Sting
-- Induces poison
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 5, 3, 180));

    return typeEffect;
end;
