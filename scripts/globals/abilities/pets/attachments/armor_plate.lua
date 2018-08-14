-----------------------------------
-- Attachment: Armor Plate
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addMod(dsp.mod.DMGPHYS, -5)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.DMGPHYS, -5)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.DMGPHYS, -2)
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.DMGPHYS, -3)
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.DMGPHYS, -5)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.DMGPHYS, -2)
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.DMGPHYS, -3)
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.DMGPHYS, -5)
    end
end
