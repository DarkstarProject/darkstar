---------------------------------------------
--  Poison Breath
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison.
--  Type: Magical Water (Element)
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
    local typeEffect = dsp.effect.POISON
    local power = math.ceil(mob:getMainLvl() / 5)

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local dmgmod = MobBreathMove(mob, target, 0.1, 1.25, dsp.magic.ele.WATER, 200)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.WATER,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.WATER)
    return dmg
end
