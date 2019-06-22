---------------------------------------------------
-- High-Tension_Discharger
-- Description: Discharges a powerful current that deals Lightning damage to players in a fan-shaped area.
-- Additional effect: Stun
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

    if ((skillList == 729 and phase >= 1 and phase <= 2) or (skillList == 728 and mobhp < 70 and mobhp >= 40)) then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.STUN
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 3, 2)

    local dmgmod = 2
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.THUNDER,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHTNING,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.LIGHTNING)
    return dmg
end
