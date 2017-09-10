-----------------------------------
-- Attachment: Turbo Charger II
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_HASTE_MAGIC, 70)
end

function onUnequip(pet)
    pet:delMod(MOD_HASTE_MAGIC, 70)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_HASTE_MAGIC, 100);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_HASTE_MAGIC, 120); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_HASTE_MAGIC, 148);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_HASTE_MAGIC, 100);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_HASTE_MAGIC, 120); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_HASTE_MAGIC, 148);
    end
end
