-----------------------------------
-- Ability: Call Beast
-- Calls a beast to fight by your side.
-- Obtained: Beastmaster Level 23
-- Recast Time: 5:00
-- Duration: Dependent on jug pet used.
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:getPet() ~= nil then
        return tpz.msg.basic.ALREADY_HAS_A_PET,0
    elseif not player:hasValidJugPetItem() then
        return tpz.msg.basic.NO_JUG_PET_ITEM,0
    elseif not player:canUseMisc(tpz.zoneMisc.PET) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA,0
    else
        return 0,0
    end
end

function onUseAbility(player, target, ability)
    local id = player:getWeaponSubSkillType(tpz.slot.AMMO)
    local effect = tpz.effect.DEBILITATION

    if id == 0 then
        printf("WARNING: jugpet id is ZERO\n")
    end

    player:spawnPet(id)
    player:removeAmmo()

    if player:hasStatusEffect(effect) then
        local pet = player:getPet()
        local statusEffect = player:getStatusEffect(effect)
        local power = statusEffect:getPower()
        local duration = math.floor(statusEffect:getTimeRemaining()/1000)
        pet:addStatusEffectEx(effect, effect, power, 0, duration)
    end
end
