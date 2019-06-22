---------------------------------------------------
-- Poison Nails  M=3? guess
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3)

    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,numhits)

    target:takeDamage(totaldamage, pet, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    target:updateEnmityFromDamage(pet,totaldamage)

    if (AvatarPhysicalHit(skill, totalDamage) and target:hasStatusEffect(dsp.effect.POISON) == false) then
        target:addStatusEffect(dsp.effect.POISON,1,3,60)
    end

    return totaldamage
end