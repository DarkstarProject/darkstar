---------------------------------------------
--  Great Whirlwind
--
--  Description: Deals Wind damage to targets in front. Additional effect: Choke
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
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
    local typeEffect = dsp.effect.CHOKE
    local power = mob:getMainLvl()/4*.6 + 4

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,dsp.magic.ele.WIND,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    return dmg
end
