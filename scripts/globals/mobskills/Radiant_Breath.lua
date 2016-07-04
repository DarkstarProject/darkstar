---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
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
    local typeEffectOne = EFFECT_SLOW;
    local typeEffectTwo = EFFECT_SILENCE;

    MobStatusEffectMove(mob, target, typeEffectOne, 128, 0, 120);
    MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 120);

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_LIGHT, 700);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
