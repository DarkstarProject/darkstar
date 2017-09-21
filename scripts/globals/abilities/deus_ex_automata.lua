-----------------------------------
-- Ability: Deus Ex Automata
-- Calls forth your automaton in an unsound state.
-- Obtained: Puppetmaster Level 5
-- Recast Time: 1:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getPet() ~= nil then
        return msgBasic.ALREADY_HAS_A_PET, 0
    elseif not player:canUsePet() then
        return msgBasic.CANT_BE_USED_IN_AREA, 0
    else
        return 0, 0
    end
end

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:spawnPet(PET_AUTOMATON)
    local pet = player:getPet()
    if pet then
        local percent = math.floor((player:getMainLvl()/3))/100
        pet:setHP(math.max(pet:getHP() * percent, 1))
        pet:setMP(pet:getMP() * percent)
    end
end