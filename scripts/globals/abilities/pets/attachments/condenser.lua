-----------------------------------
-- Attachment: Condenser
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(tpz.mod.PREVENT_OVERLOAD, 1)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.PREVENT_OVERLOAD, 1)
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
