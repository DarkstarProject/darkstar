-----------------------------------
-- Attachment: Smoke Screen
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(dsp.mod.EVA, 20)
    pet:addMod(dsp.mod.ACC, -20)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.EVA, 20)
    pet:delMod(dsp.mod.ACC, -20)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(dsp.mod.EVA, 20)
        pet:addMod(dsp.mod.ACC, -20)
    elseif maneuvers == 2 then
        pet:addMod(dsp.mod.EVA, 40)
        pet:addMod(dsp.mod.ACC, -40)
    elseif maneuvers == 3 then
        pet:addMod(dsp.mod.EVA, 80)
        pet:addMod(dsp.mod.ACC, -80)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(dsp.mod.EVA, 20)
        pet:delMod(dsp.mod.ACC, -20)
    elseif maneuvers == 2 then
        pet:delMod(dsp.mod.EVA, 40)
        pet:delMod(dsp.mod.ACC, -40)
    elseif maneuvers == 3 then
        pet:delMod(dsp.mod.EVA, 80)
        pet:delMod(dsp.mod.ACC, -80)
    end
end
