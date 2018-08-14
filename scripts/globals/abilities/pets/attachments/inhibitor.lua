-----------------------------------
-- Attachment: Inhibitor
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addMod(dsp.mod.STORETP, 5)
    pet:addMod(dsp.mod.AUTO_TP_EFFICIENCY, 900)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.STORETP, 5)
    pet:delMod(dsp.mod.AUTO_TP_EFFICIENCY, 900)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.STORETP, 10)
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.STORETP, 10)
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.STORETP, 15)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.STORETP, 10)
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.STORETP, 10)
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.STORETP, 15)
    end
end
