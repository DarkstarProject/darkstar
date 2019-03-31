-----------------------------------
-- Attachment: Inhibitor II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 10)
    pet:addMod(dsp.mod.AUTO_TP_EFFICIENCY, 900)
end

function onUnequip(pet)
    updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 0)
    pet:delMod(dsp.mod.AUTO_TP_EFFICIENCY, 900)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 10)
    elseif maneuvers == 1 then
        updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 25)
    elseif maneuvers == 2 then
        updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 40)
    elseif maneuvers == 3 then
        updateModPerformance(pet, dsp.mod.STORETP, 'inhibitor_ii_mod', 65)
    end
end
