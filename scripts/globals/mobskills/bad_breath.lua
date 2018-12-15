---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
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

    MobStatusEffectMove(mob, target, dsp.effect.SLOW, 1250, 0, 60)

    MobStatusEffectMove(mob, target, dsp.effect.POISON, mob:getMainLvl() / 10, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.SILENCE, 1, 0, 60)
    MobStatusEffectMove(mob, target, dsp.effect.PARALYSIS, 15, 0, 60)
    MobStatusEffectMove(mob, target, dsp.effect.BIND, 1, 0, 30)
    MobStatusEffectMove(mob, target, dsp.effect.BLINDNESS, 15, 0, 60)
    MobStatusEffectMove(mob, target, dsp.effect.WEIGHT, 50, 0, 60)

    local dmgmod = MobBreathMove(mob, target, 0.15, 3, dsp.magic.ele.EARTH, 500)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, dsp.attackType.BREATH, dsp.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.EARTH)
    return dmg
end
