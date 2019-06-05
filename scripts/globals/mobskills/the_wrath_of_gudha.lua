require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    
    local typeEffect = dsp.effect.WEIGHT

    local numhits = 1
    local accmod = 1
    local dmgmod = 5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,0,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.NONE,info.hitslanded)

        MobStatusEffectMove(mob, target, typeEffect, 80, 0, 10)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.NONE)
    return dmg
end
