---------------------------------------------------
-- Palsy Pollen
-- Conal paralyze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 60));

    return typeEffect;
end
