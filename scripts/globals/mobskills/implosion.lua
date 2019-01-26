---------------------------------------------
-- Implosion
--
-- Description: Channels a wave of negative energy, damaging all targets in very wide area of effect.
-- Type: Magical
-- Wipes Shadows
-- Range: 10' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),dsp.magic.ele.DARK,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)
    return dmg
end
