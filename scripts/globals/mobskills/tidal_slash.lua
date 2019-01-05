---------------------------------------------
-- Tidal Slash
-- Deals water damage conal
-- Type: Magical
-- Only used when wielding a spear
-- Utsusemi/Blink absorb: 2-3 shadow
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if mob:AnimationSub() == 0 and mob:getMainJob() == dsp.job.SAM then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,dsp.magic.ele.WATER,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WATER,MOBPARAM_3_SHADOW)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WATER)
    return dmg
end
