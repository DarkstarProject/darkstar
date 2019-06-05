---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = dsp.effect.SLOW
    local typeEffectTwo = dsp.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffectOne, 1250, 0, 120)
    MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 120)

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, dsp.magic.ele.LIGHT, 700)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.LIGHT,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.LIGHT)
    return dmg
end
