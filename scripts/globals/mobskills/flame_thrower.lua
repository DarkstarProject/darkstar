---------------------------------------------------
-- Flame_Thrower
-- Description: Uses a flamethrower that deals Fire damage to players in a fan-shaped area of effect. Additional effect: Plague
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(dsp.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()
    local phase = mob:getLocalVar("battlePhase")

    if mob:getLocalVar("nuclearWaste") == 1 then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.PLAGUE
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 5, 3, 30)

    local dmgmod = 2
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.FIRE,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.FIRE)
    if target:hasStatusEffect(dsp.effect.ELEMENTALRES_DOWN) then
        target:delStatusEffectSilent(dsp.effect.ELEMENTALRES_DOWN)
    end
    mob:setLocalVar("nuclearWaste", 0)
    return dmg
end