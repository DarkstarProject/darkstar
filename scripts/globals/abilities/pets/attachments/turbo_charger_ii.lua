-----------------------------------
-- Attachment: Turbo Charger II
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(dsp.mod.HASTE_MAGIC, 700)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HASTE_MAGIC, 700)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(dsp.mod.HASTE_MAGIC, 1000)
    elseif maneuvers == 2 then
        pet:addMod(dsp.mod.HASTE_MAGIC, 1100)
    elseif maneuvers == 3 then
        pet:addMod(dsp.mod.HASTE_MAGIC, 1575)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(dsp.mod.HASTE_MAGIC, 1000)
    elseif maneuvers == 2 then
        pet:delMod(dsp.mod.HASTE_MAGIC, 1100)
    elseif maneuvers == 3 then
        pet:delMod(dsp.mod.HASTE_MAGIC, 1575)
    end
end
