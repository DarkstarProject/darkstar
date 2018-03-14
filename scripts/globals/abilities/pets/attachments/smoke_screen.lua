-----------------------------------
-- Attachment: Smoke Screen
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(MOD_EVA, 20);
    pet:addMod(MOD_ACC, -20);
end

function onUnequip(pet)
    pet:delMod(MOD_EVA, 20);
    pet:delMod(MOD_ACC, -20);
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_EVA, 20);
        pet:addMod(MOD_ACC, -20);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_EVA, 40);
        pet:addMod(MOD_ACC, -40);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_EVA, 80);
        pet:addMod(MOD_ACC, -80);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_EVA, 20);
        pet:delMod(MOD_ACC, -20);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_EVA, 40);
        pet:delMod(MOD_ACC, -40);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_EVA, 80);
        pet:delMod(MOD_ACC, -80);
    end
end
