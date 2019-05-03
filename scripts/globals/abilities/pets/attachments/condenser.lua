-----------------------------------
-- Attachment: Condenser
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(dsp.mod.PREVENT_OVERLOAD, 1)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.PREVENT_OVERLOAD, 1)
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
