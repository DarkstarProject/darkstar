-----------------------------------------
-- ID: 18306, 18307, 18644, 18658, 18672, 19753, 19846, 20880, 20881, 21808
-- Item: Apocalypse
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/weaponskills")
require("scripts/globals/weaponskillids")
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_APOCALYPSE"
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_APOCALYPSE"

-- https://www.bg-wiki.com/bg/Relic_Aftermath
local aftermathTable = {}

-- Apocalypse 75
aftermathTable[18306] =
{
    power=1,
    duration = function(tp) return math.floor(0.02 * tp) end,
    mods =
    {
        { id=dsp.mod.HASTE_GEAR, power=1000 }
    }
}
aftermathTable[18307] = aftermathTable[18306] -- Apocalypse (80)
aftermathTable[18644] = aftermathTable[18306] -- Apocalypse (85)
aftermathTable[18658] = aftermathTable[18306] -- Apocalypse (90)
aftermathTable[18672] = aftermathTable[18306] -- Apocalypse (95)
aftermathTable[19753] = aftermathTable[18306] -- Apocalypse (99)
aftermathTable[19846] = aftermathTable[18306] -- Apocalypse (99/II)
aftermathTable[20880] = aftermathTable[18306] -- Apocalypse (119)
aftermathTable[20881] = aftermathTable[18306] -- Apocalypse (119/II)

-- Apocalypse (119/III)
aftermathTable[21808] =
{
    power=2,
    duration = function(tp) return math.floor(0.06 * tp) end,
    mods =
    {
        { id=dsp.mod.HASTE_GEAR, power=1000 },
        { id=dsp.mod.ACC, power=15 }
    }
}

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.CATASTROPHE) then -- Catastrophe onry
        local itemId = user:getEquipID(dsp.slot.MAIN)
        if (aftermathTable[itemId]) then
            -- Apply the effect and add mods
            addAftermathEffect(user, tp, aftermathTable[itemId])
            -- Add a listener for when aftermath wears (to remove mods)
            user:addListener("EFFECT_LOSE", NAME_EFFECT_LOSE, aftermathLost)
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == dsp.effect.AFTERMATH) then
        local itemId = target:getEquipID(dsp.slot.MAIN)
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeAftermathEffect(target, aftermathTable[itemId])
            -- Remove the effect listener
            target:removeListener(NAME_EFFECT_LOSE)
        end
    end
end

function onItemCheck(player, param, caster)
    if (param == dsp.itemCheck.EQUIP) then
        player:addListener("WEAPONSKILL_USE", NAME_WEAPONSKILL, onWeaponskill)
    elseif (param == dsp.itemCheck.UNEQUIP) then
        -- Make sure we clean up the effect and mods
        if (player:hasStatusEffect(dsp.effect.AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(dsp.effect.AFTERMATH))
        end
        player:removeListener(NAME_WEAPONSKILL)
    end
    
    return 0
end

function onAdditionalEffect(player,target,damage)
    local chance = 10

    -- if (target:hasImmunity(64)) then
        -- spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    -- This does nothing, as this is not a spell, and it doesn't get used in the return.
    -- That should be handled in the resist check in the global anyways.

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.BLINDNESS, 15, 0, 30)
        return dsp.subEffect.BLIND, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.BLINDNESS
    end
end
