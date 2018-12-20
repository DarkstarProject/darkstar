---------------------------------------------
--  Medusa Javelin
--  Aern (DRG & SAM)
--  Blinkable 1 hit, Knockback, Hate Reset
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)

    local typeEffect = dsp.effect.PETRIFICATION

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 60)

    return dmg
end