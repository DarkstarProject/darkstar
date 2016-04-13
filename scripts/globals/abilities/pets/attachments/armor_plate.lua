-----------------------------------
-- Attachment: Armor Plate
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_DMGPHYS, -5)
end

function onUnequip(pet)
    pet:delMod(MOD_DMGPHYS, -5)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_DMGPHYS, -2);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_DMGPHYS, -3); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_DMGPHYS, -5);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_DMGPHYS, -2);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_DMGPHYS, -3); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_DMGPHYS, -5);
    end
end
