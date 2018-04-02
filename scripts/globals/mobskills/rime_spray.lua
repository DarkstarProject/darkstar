---------------------------------------------
--  Rime Spray
--
--  Description: Deals Ice damage to enemies within a fan-shaped area, inflicting them with Frost and All statuses down.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT.FROST;

    MobStatusEffectMove(mob, target, EFFECT.FROST, 15, 3, 120);
    MobStatusEffectMove(mob, target, EFFECT.STR_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.VIT_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.DEX_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.AGI_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.MND_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.INT_DOWN, 20, 3, 60);
    MobStatusEffectMove(mob, target, EFFECT.CHR_DOWN, 20, 3, 60);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_ICE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
