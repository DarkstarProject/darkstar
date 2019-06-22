---------------------------------------------
--  Gusting Gouge
--  Description: Deals Wind damage in a threefold attack to targets in a fan-shaped area of effect.
--  Type: Physical?
--  Utsusemi/Blink absorb: 2-3 shadows
--  Notes: Used only by Lamia equipped with a one-handed weapon. If they lost their weapon, they'll use Hysteric Barrage instead.
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if mob:AnimationSub() == 0 and (mob:getMainJob() == dsp.job.COR or mob:getMainJob() == dsp.job.BRD or mob:getMainJob() == dsp.job.RDM) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCE,info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    return dmg
end
