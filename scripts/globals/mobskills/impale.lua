---------------------------------------------
--  Impale
--
--  Description: Deals damage to a single target. Additional effect: Paralysis (NM version AE applies a strong poison effect and resets enmity on target)
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow (NM version ignores shadows)
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PARALYSIS
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.3
    local shadows = info.hitslanded
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)

    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        shadows = MOBPARAM_IGNORE_SHADOWS
        typeEffect = dsp.effect.POISON
		mob:resetEnmity(target)
    end

    local dmg = MobFinalAdjustments(info.dmg, mob, skill,target, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING,shadows)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
	
    return dmg
end
