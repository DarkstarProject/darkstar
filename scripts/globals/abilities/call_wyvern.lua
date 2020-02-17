-----------------------------------
-- Ability: Call Wyvern
-- Summons a Wyvern to fight by your side.
-- Obtained: Dragoon Level 1
-- Recast Time: 20:00
-- Duration: Instant
-- Special: Only available if Dragoon is your main class.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:getPet() ~= nil then
         return tpz.msg.basic.ALREADY_HAS_A_PET,0
    elseif player:hasStatusEffect(tpz.effect.SPIRIT_SURGE) then
        return tpz.msg.basic.UNABLE_TO_USE_JA,0
    elseif not player:canUseMisc(tpz.zoneMisc.PET) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA,0
    else
        return 0,0
    end
end

function onUseAbility(player, target, ability)
    local effect = tpz.effect.DEBILITATION

    player:spawnPet(tpz.pet.id.WYVERN)

    if player:hasStatusEffect(effect) then
        local pet = player:getPet()
        local statusEffect = player:getStatusEffect(effect)
        local power = statusEffect:getPower()
        local duration = math.floor(statusEffect:getTimeRemaining()/1000)
        pet:addStatusEffectEx(effect, effect, power, 0, duration)
    end
end
