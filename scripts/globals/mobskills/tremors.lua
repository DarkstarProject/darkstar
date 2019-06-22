---------------------------------------------------
-- Tremors
-- Deals Earth damage with a seismic disturbance. Additional effect: DEX Down
-- Area of Effect is centered around caster.
-- Utsusemi/Blink absorb: Wipes shadows
-- Duration: Three minutes ?
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.DEX_DOWN

    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,dsp.magic.ele.EARTH,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.EARTH,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
