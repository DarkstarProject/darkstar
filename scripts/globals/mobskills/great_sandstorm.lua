---------------------------------------------
--  Great Sandstorm
--
--  Description: Deals Earth damage to single target. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single target
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

    MobStatusEffectMove(mob, target, typeEffect, 15, 0, 120)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,dsp.magic.ele.EARTH,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.EARTH,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
