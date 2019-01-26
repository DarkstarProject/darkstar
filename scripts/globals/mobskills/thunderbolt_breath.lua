---------------------------------------------
--  Thunderbolt
--
--  Description: Deals thunder damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Thunder)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    -- not used in Uleguerand_Range
    if (mob:getZoneID() == 5) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local typeEffect = dsp.effect.STUN

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 7)

    local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, dsp.magic.ele.THUNDER, 500)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.LIGHTNING,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.LIGHTNING)
    return dmg
end
