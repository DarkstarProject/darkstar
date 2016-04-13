-----------------------------------
-- Attachment: Vivi-valve
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
end

function onUnequip(pet)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_CURE_POTENCY, 15);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_CURE_POTENCY, 15); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_CURE_POTENCY, 15);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_CURE_POTENCY, 15);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_CURE_POTENCY, 15); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_CURE_POTENCY, 15);
    end
end
