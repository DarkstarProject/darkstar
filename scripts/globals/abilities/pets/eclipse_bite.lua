---------------------------------------------------
-- Eclipse Bite M=8 subsequent hits M=2
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
    local dmgmod = 8
    local dmgmodsubsequent = 2
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,numhits)
    target:takeDamage(totaldamage, pet, dsp.attackType.PHYSICAL, dsp.damageType.SLASH)
    target:updateEnmityFromDamage(pet,totaldamage)
    return totaldamage
end
