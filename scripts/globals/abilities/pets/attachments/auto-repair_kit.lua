-----------------------------------
-- Attachment: Auto-repair Kit
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.HPP, 5)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HPP, 5)
end

-- regen values from http://wiki.ffo.jp/html/8619.html
local prefix = "autoRepairKit1_"
local regenValues =
{
    [1] = {base=1, pct=0.125},
    [2] = {base=1, pct=0.125},
    [3] = {base=1, pct=0.125},
}

function onManeuverGain(pet,maneuvers)
    local rVals = regenValues[maneuvers]
    local power = math.floor(rVals.base + (pet:getMaxHP() * rVals.pct / 100))

    pet:setLocalVar(prefix .. maneuvers, power)
    pet:addMod(dsp.mod.REGEN, power)
end

function onManeuverLose(pet,maneuvers)
    pet:delMod(dsp.mod.REGEN, pet:getLocalVar(prefix .. maneuvers))
    pet:setLocalVar(prefix .. maneuvers, 0)
end
