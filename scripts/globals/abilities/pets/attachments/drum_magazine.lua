-----------------------------------
-- Attachment: Drum Magazine
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addMod(dsp.mod.SNAP_SHOT, 2)
    pet:addMod(dsp.mod.ACC, -2)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.SNAP_SHOT, 2)
    pet:delMod(dsp.mod.ACC, -2)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.SNAP_SHOT, 4)
        pet:addMod(dsp.mod.ACC, -4)
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.SNAP_SHOT, 2)
        pet:addMod(dsp.mod.ACC, -2)
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.SNAP_SHOT, 7)
        pet:addMod(dsp.mod.ACC, -7)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.SNAP_SHOT, 4)
        pet:delMod(dsp.mod.ACC, -4)
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.SNAP_SHOT, 2)
        pet:delMod(dsp.mod.ACC, -2)
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.SNAP_SHOT, 7)
        pet:delMod(dsp.mod.ACC, -7)
    end
end
