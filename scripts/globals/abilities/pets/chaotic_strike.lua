---------------------------------------------------
-- Chaotic Strike M=9 , 2
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 9
    local dmgmodsubsequent = 2
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,numhits)
    target:addStatusEffect(dsp.effect.STUN, 1, 0, 2)
    target:takeDamage(totaldamage, pet, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    target:updateEnmityFromDamage(pet,totaldamage)
    return totaldamage
end
