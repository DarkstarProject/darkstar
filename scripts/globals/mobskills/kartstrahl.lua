---------------------------------------------
-- Kartstrahl
--
-- Description: Single target damage with sleep.
-- Type: Physical
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,info.hitslanded)

    local typeEffect = dsp.effect.SLEEP_I

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    return dmg
end
