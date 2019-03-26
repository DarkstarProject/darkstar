-----------------------------------
-- Attachment: Tension Spring IV
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, dsp.mod.ATTP, 'tension_iv_attp', 0)
    updateModPerformance(pet, dsp.mod.RATTP, 'tension_iv_rattp', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_iv_attp', 15)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_iv_rattp', 15)
    elseif maneuvers == 1 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_iv_attp', 18)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_iv_rattp', 18)
    elseif maneuvers == 2 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_iv_attp', 21)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_iv_rattp', 21)
    elseif maneuvers == 3 then
        updateModPerformance(pet, dsp.mod.ATTP, 'tension_iv_attp', 24)
        updateModPerformance(pet, dsp.mod.RATTP, 'tension_iv_rattp', 24)
    end
end
