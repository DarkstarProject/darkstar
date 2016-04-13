-----------------------------------
-- Attachment: Drum Magazine
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_SNAP_SHOT, 2)
    pet:addMod(MOD_ACC, -2)
end

function onUnequip(pet)
    pet:delMod(MOD_SNAP_SHOT, 2)
    pet:delMod(MOD_ACC, -2)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_SNAP_SHOT, 4);
        pet:addMod(MOD_ACC, -4);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_SNAP_SHOT, 2); 
        pet:addMod(MOD_ACC, -2);
    elseif (maneuvers == 3) then
        pet:addMod(MOD_SNAP_SHOT, 7);
        pet:addMod(MOD_ACC, -7);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_SNAP_SHOT, 4);
        pet:delMod(MOD_ACC, -4);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_SNAP_SHOT, 2); 
        pet:delMod(MOD_ACC, -2);
    elseif (maneuvers == 3) then
        pet:delMod(MOD_SNAP_SHOT, 7);
        pet:delMod(MOD_ACC, -7);
    end
end
