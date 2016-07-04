---------------------------------------------------
-- Sand Breath
-- Deals Earth damage to enemies within a fan-shaped area. Additional effect: Blind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 180);

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_EARTH, 800);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
