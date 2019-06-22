---------------------------------------------
--  Touchdown
--
--  Description: Deals magical damage to enemies in an area of effect.
--  Further Notes: Bahamut can use this as a regular move at will.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,dsp.magic.ele.NONE,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.NONE,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.NONE)

    return dmg
end
