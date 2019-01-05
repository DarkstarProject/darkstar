---------------------------------------------
--  Chomp Rush
--
--  Description: Deals damage in a threefold attack to a single target. Additional effect: slow (25%)
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 3
    local accmod = 1
    local dmgmod = 1.1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)

    local typeEffect = dsp.effect.SLOW

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1250, 0, 60)

    return dmg
end
