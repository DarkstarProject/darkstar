---------------------------------------------
--  Haymaker
--  Description: Punches the daylights out of all targets in front. Additional effect: Amnesia
--  Type: Physical
--  Utsusemi/Blink absorb: Unknown
--  Range: Front cone
--  Notes: Only used by Gurfurlur the Menacing.
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.H2H,info.hitslanded)

    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effects.AMNESIA, 1, 0, 60)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.H2H)
    return dmg
end
