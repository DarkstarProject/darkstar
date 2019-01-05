---------------------------------------------
-- Earthbreaker
--
-- Description: Deals Earth damage to enemies within area of effect. Additional effect: Stun
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 15' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.STUN
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 8)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*6,dsp.magic.ele.EARTH,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.EARTH,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
