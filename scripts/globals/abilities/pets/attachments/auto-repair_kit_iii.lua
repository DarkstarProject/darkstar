-----------------------------------
-- Attachment: Auto-repair Kit III
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.HPP, 15)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HPP, 15)
end

-- regen values from http://wiki.ffo.jp/html/8619.html
local prefix = "autoRepairKit3_"
local regenValues =
{
    [1] = {base=9, pct=1.8},
    [2] = {base=3, pct=0.6},
    [3] = {base=3, pct=0.6},
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
