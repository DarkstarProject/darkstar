-----------------------------------
-- Attachment: Galvanizer
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_COUNTER, 10)
end

function onUnequip(pet)
    pet:delMod(MOD_COUNTER, 10)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_COUNTER, 10);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_COUNTER, 15); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_COUNTER, 15);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_COUNTER, 10);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_COUNTER, 15); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_COUNTER, 15);
    end
end
