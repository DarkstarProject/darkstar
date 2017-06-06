---------------------------------------------
--  Silence Gas
--
--  Description: Emits a noxious cloud in a fan-shaped area of effect, dealing Wind damage to all targets. Additional effect: silence
--  Type: Magical Wind (Element)
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
    local typeEffect = EFFECT_SILENCE;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60);


    local dmgmod = MobBreathMove(mob, target, 0.25, 2, ELE_WIND, 800);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
