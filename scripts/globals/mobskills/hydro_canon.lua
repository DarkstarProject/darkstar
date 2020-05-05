---------------------------------------------------
--  Hydro_Canon
--  Description:
--  Type: Magical
--  additional effect : 40hp/tick Poison
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

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
    local typeEffect = dsp.effect.POISON
    local power = 40
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60)
    
    local dmgmod = 2
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.WATER,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WATER,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WATER)
    if target:hasStatusEffect(dsp.effect.ELEMENTALRES_DOWN) then
        target:delStatusEffectSilent(dsp.effect.ELEMENTALRES_DOWN)
    end
    mob:setLocalVar("nuclearWaste", 0)
    return dmg
end