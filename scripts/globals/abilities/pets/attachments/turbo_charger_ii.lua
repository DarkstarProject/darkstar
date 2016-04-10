-----------------------------------
-- Attachment: Turbo Charger II
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_HASTE_MAGIC, 71)
end

function onUnequip(pet)
    pet:delMod(MOD_HASTE_MAGIC, 71)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_HASTE_MAGIC, 102);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_HASTE_MAGIC, 122); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_HASTE_MAGIC, 153);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_HASTE_MAGIC, 102);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_HASTE_MAGIC, 122); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_HASTE_MAGIC, 153);
    end
end
