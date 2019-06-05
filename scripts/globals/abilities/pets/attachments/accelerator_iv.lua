-----------------------------------
-- Attachment: Accelerator IV
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(dsp.mod.EVA, 30)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.EVA, 30)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(dsp.mod.EVA, 15)
    elseif maneuvers == 2 then
        pet:addMod(dsp.mod.EVA, 15)
    elseif maneuvers == 3 then
        pet:addMod(dsp.mod.EVA, 20)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(dsp.mod.EVA, 15)
    elseif maneuvers == 2 then
        pet:delMod(dsp.mod.EVA, 15)
    elseif maneuvers == 3 then
        pet:delMod(dsp.mod.EVA, 20)
    end
end