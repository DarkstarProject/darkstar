---------------------------------------------
--  Black Cloud
--
--  Description: A cloud deals Dark damage to enemies in an area of effect. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
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
    local typeEffect = dsp.effect.BLINDNESS

    MobStatusEffectMove(mob, target, typeEffect, 18, 0, 180)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.DARK,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)

    return dmg
end
