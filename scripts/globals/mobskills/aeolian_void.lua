---------------------------------------------
-- Aeolian Void
--
-- Description: Fan AoE damage plus Silence and Blind
-- Type: Earth Damage/Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target,mob,skill)
    local typeEffectOne = EFFECT_SILENCE;
    local typeEffectTwo = EFFECT_BLINDNESS;

    MobStatusEffectMove(mob,target,typeEffectOne,1,0,60);
    MobStatusEffectMove(mob,target,typeEffectTwo,15,0,60);

    local dmgmod = MobBreathMove(mob,target, 0.25,2.5,ELE_EARTH,300);
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
