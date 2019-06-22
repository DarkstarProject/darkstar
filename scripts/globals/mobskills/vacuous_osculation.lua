---------------------------------------------
--  Vacuous Osculation
--
--  Description: Deals damage to a single target. Additional effect: Poison, Plague
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
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
    local dmgmod = 2.6
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)


    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.PLAGUE, 5, 3, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.POISON, mob:getMainLvl() / 6, 3, 60)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end
