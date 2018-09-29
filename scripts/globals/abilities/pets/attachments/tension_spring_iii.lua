-----------------------------------
-- Attachment: Tension Spring III
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.ATTP, 9)
    pet:addMod(dsp.mod.RATTP, 9)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.ATTP, 9)
    pet:delMod(dsp.mod.RATTP, 9)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.ATTP, 3);
        pet:addMod(dsp.mod.RATTP, 3)
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.ATTP, 2);
        pet:addMod(dsp.mod.RATTP, 2)
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.ATTP, 3);
        pet:addMod(dsp.mod.RATTP, 3)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.ATTP, 3);
        pet:delMod(dsp.mod.RATTP, 3)
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.ATTP, 2);
        pet:delMod(dsp.mod.RATTP, 2)
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.ATTP, 3);
        pet:delMod(dsp.mod.RATTP, 3)
    end
end
