-----------------------------------
-- Ability: Role Reversal
-- Swaps Master's current HP with Automaton's current HP.
-- Obtained: Puppetmaster Level 75
-- Recast Time: 2:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if not player:getPet() then
        return MSGBASIC_REQUIRES_A_PET, 0
    elseif not player:getPetID() or not (player:getPetID() >= 69 and player:getPetID() <= 72) then
        return MSGBASIC_NO_EFFECT_ON_PET, 0
    else
        return 0, 0
    end
end

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet()
    if pet then
        local bonus = 1 + (player:getMerit(MERIT_ROLE_REVERSAL)-5)/100
        local playerHP = player:getHP()
        local petHP = pet:getHP()
        pet:setHP(math.max(playerHP * bonus, 1))
        player:setHP(math.max(petHP * bonus, 1))
    end
end