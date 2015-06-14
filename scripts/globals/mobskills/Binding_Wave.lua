---------------------------------------------------
-- Binding Wave
-- Additional effect: bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));

    return typeEffect;
end;
