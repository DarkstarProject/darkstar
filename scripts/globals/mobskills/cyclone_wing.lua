---------------------------------------------
-- Cyclone Wing
--
-- Description: Deals darkness damage to enemies within a very wide area of effect. Additional effect: Sleep
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 30' radial.
-- Notes: Used only by Vrtra and Azdaja
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 1) then
        return 1
    elseif (target:isBehind(mob, 48) == true) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.SLEEP_I

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,dsp.magic.ele.DARK,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)
    return dmg
end
