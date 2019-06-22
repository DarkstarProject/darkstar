---------------------------------------------
--  Final Heaven
--
--  Description:  Delivers an attack that can stun the target. Shield required.
--  Type: Physical
--  Range: Melee
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
    local dmgmod = 8
    
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,2,2)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,info.hitslanded)

    MobStatusEffectMove(mob, target, dsp.effect.STUN, 1, 0, 7)
    
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    return dmg
    
end