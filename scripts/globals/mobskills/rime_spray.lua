---------------------------------------------
--  Rime Spray
--
--  Description: Deals Ice damage to enemies within a fan-shaped area, inflicting them with Frost and All statuses down.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.FROST

    MobStatusEffectMove(mob, target, dsp.effect.FROST, 15, 3, 120)
    MobStatusEffectMove(mob, target, dsp.effect.STR_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.VIT_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.DEX_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.AGI_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.MND_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.INT_DOWN, 20, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.CHR_DOWN, 20, 3, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,dsp.magic.ele.ICE,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.ICE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.ICE)
    return dmg
end
