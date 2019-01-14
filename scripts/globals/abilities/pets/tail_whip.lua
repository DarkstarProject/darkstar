---------------------------------------------------
-- Tail Whip M=5
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 5

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,numhits)

    local duration = 120
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT),dsp.skill.ELEMENTAL_MAGIC, 5)
    if resm < 0.25 then
        resm = 0
    end
    duration = duration * resm

    if (duration > 0 and AvatarPhysicalHit(skill, totaldamage) and target:hasStatusEffect(dsp.effect.WEIGHT) == false) then
        target:addStatusEffect(dsp.effect.WEIGHT, 50, 0, duration)
    end
    target:takeDamage(totaldamage, pet, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    target:updateEnmityFromDamage(pet,totaldamage)

    return totaldamage
end