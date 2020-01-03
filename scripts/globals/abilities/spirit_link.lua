-----------------------------------
-- Ability: Spirit Link
-- Sacrifices own HP to heal Wyvern's HP.
-- Obtained: Dragoon Level 25
-- Recast Time: 1:30
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function cutEmpathyEffectTable(validEffects,i,maxCount)
    local delindex = 1

    while maxCount < i do
        delindex = math.random(1,i)
        while validEffects[delindex+1] ~= nil do
            validEffects[delindex] = validEffects[delindex+1]
            delindex = delindex + 1
        end
        validEffects[delindex+1] = nil -- could be in the above loop, but unsure if Lua allows copying of nil?
        i = i - 1
    end

    return validEffects
end

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return dsp.msg.basic.REQUIRES_A_PET,0
    else
        if (player:getPet():getHP() == player:getPet():getMaxHP() and player:getMerit(dsp.merit.EMPATHY) == 0) then
            return dsp.msg.basic.UNABLE_TO_USE_JA,0
        else
            return 0,0
        end
    end
end

function onUseAbility(player,target,ability)

    local playerHP = player:getHP()
    local drainamount = (math.random(25,35) / 100) * playerHP
    if (player:getPet():getHP() == player:getPet():getMaxHP()) then
        drainamount = 0 -- Prevents player HP lose if wyvern is at full HP
    end

    if (player:hasStatusEffect(dsp.effect.STONESKIN)) then
        local skin = player:getMod(dsp.mod.STONESKIN)

        if (skin >= drainamount) then
            if (skin == drainamount) then
                player:delStatusEffect(dsp.effect.STONESKIN)
            else
                local effect = player:getStatusEffect(dsp.effect.STONESKIN)
                effect:setPower(effect:getPower() - drainamount) -- fixes the status effeect so when it ends it uses the new power instead of old
                player:delMod(dsp.mod.STONESKIN,drainamount) --removes the amount from the mod

            end
        else
            player:delStatusEffect(dsp.effect.STONESKIN)
            player:takeDamage(drainamount - skin)
        end

    else
        player:takeDamage(drainamount)
    end

    local pet = player:getPet()
    local healPet = drainamount * 2
    local petTP = pet:getTP()
    local regenAmount = player:getMainLvl()/3 -- level/3 tic regen

    if (player:getEquipID(dsp.slot.HEAD)==15238) then
        healPet = healPet + 15
    end

    pet:delStatusEffect(dsp.effect.POISON)
    pet:delStatusEffect(dsp.effect.BLINDNESS)
    pet:delStatusEffect(dsp.effect.PARALYSIS)

    if (math.random(1,2) == 1) then
        pet:delStatusEffect(dsp.effect.DOOM)
    end
    if (pet:getHP() < pet:getMaxHP()) then -- sleep is only removed if it heals the wyvern
        removeSleepEffects(pet)
    end
    
    -- Empathy copying
    local empathyTotal = player:getMerit(dsp.merit.EMPATHY)
    if empathyTotal > 0 then
        local effects = player:getStatusEffects()
        local validEffects = { }
        local i = 0 -- highest existing index
        local copyi = 0

        for _,effect in ipairs(effects) do
            if bit.band(effect:getFlag(),dsp.effectFlag.EMPATHY) == dsp.effectFlag.EMPATHY then
                validEffects[i+1] = effect
                i = i + 1
            end
        end

        if i < empathyTotal then
            empathyTotal = i
        elseif i > empathyTotal then
            validEffects = cutEmpathyEffectTable(validEffects,i,empathyTotal)
        end

        local copyEffect = nil
        while copyi < empathyTotal do
            copyEffect = validEffects[copyi+1]
            if pet:hasStatusEffect(copyEffect:getType()) then
                pet:delStatusEffect(copyEffect:getType())
            end

            pet:addStatusEffect(copyEffect:getType(),copyEffect:getPower(),copyEffect:getTick(),math.ceil((copyEffect:getTimeRemaining())/1000)) -- id,power,tick,duration(convert ms to s)
            copyi = copyi + 1
        end
    end

    pet:addHP(healPet) --add the hp to pet
    pet:addStatusEffect(dsp.effect.REGEN,regenAmount,3,90,0,0,0) -- 90 seconds of regen
    player:addTP(petTP/2) --add half pet tp to you
    pet:delTP(petTP/2) -- remove half tp from pet
end
