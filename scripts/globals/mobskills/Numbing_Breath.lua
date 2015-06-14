---------------------------------------------
--  Numbing Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralyze.
--  Type: Magical Ice (Element)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;
    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 60);

    local dmgmod = MobBreathMove(mob, target, 0.2, 1.875, ELE_ICE, 500);
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
