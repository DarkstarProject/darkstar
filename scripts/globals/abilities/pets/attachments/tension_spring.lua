-----------------------------------
-- Attachment: Tension Spring
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, dsp.mod.ATTP, 'tension_attp', 0)
    updateModPerformance(pet, dsp.mod.RATTP, 'tension_rattp', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_attp', 3)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_rattp', 3)
    elseif maneuvers == 1 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_attp', 6)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_rattp', 6)
    elseif maneuvers == 2 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_attp', 9)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_rattp', 9)
    elseif maneuvers == 3 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_attp', 12)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_rattp', 12)
    end
end
