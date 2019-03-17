-----------------------------------
-- Attachment: Schurzen
-- Prevents fatal damage and instead leaves the automaton at 1HP and consumes an Earth Manuever
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(dsp.mod.AUTO_SCHURZEN, 1)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.AUTO_SCHURZEN, 1)
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
