-----------------------------------
-- Attachment: Tension Spring
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_ATTP, 3)
    pet:addMod(MOD_RATTP, 3)
end

function onUnequip(pet)
    pet:delMod(MOD_ATTP, 3)
    pet:addMod(MOD_RATTP, 3)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_ATTP, 3);
        pet:addMod(MOD_RATTP, 3)
    elseif (maneuvers == 2) then
        pet:addMod(MOD_ATTP, 3); 
        pet:addMod(MOD_RATTP, 3)
    elseif (maneuvers == 3) then
        pet:addMod(MOD_ATTP, 3);
        pet:addMod(MOD_RATTP, 3)
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_ATTP, 3);
        pet:addMod(MOD_RATTP, 3)
    elseif (maneuvers == 2) then
        pet:delMod(MOD_ATTP, 3); 
        pet:addMod(MOD_RATTP, 3)
    elseif (maneuvers == 3) then
        pet:delMod(MOD_ATTP, 3);
        pet:addMod(MOD_RATTP, 3)
    end
end
