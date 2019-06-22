---------------------------------------------
--  Pestilent Penance
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local typeEffect = dsp.effect.PLAGUE

    MobStatusEffectMove(mob, target, typeEffect, 10, 0, 120)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,dsp.magic.ele.DARK,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)
    return dmg
end
