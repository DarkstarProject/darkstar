---------------------------------------------
--  Frost Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis.
--  Type: Magical (Ice)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- only used in Uleguerand_Range
    if (mob:getZoneID() == 5) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PARALYSIS

    MobStatusEffectMove(mob, target, typeEffect, 25, 0, 120)

    local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, dsp.magic.ele.ICE, 500)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.ICE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.ICE)
    return dmg
end
