---------------------------------------------
--  Numbing Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralyze.
--  Type: Magical Ice (Element)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PARALYSIS
    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 60)

    local dmgmod = MobBreathMove(mob, target, 0.2, 1.875, dsp.magic.ele.ICE, 500)
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.ICE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.ICE)
    return dmg
end
