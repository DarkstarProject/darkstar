-----------------------------------
-- Attachment: Damage Gauge
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_AUTO_HEALING_THRESHOLD, 20)
end

function onUnequip(pet)
    pet:delMod(MOD_AUTO_HEALING_THRESHOLD, 20)
end

function onManeuverGain(pet,maneuvers)
    if (maneuvers == 1) then
        pet:addMod(MOD_AUTO_HEALING_THRESHOLD, 10);
    end
end

function onManeuverLose(pet,maneuvers)
    if (maneuvers == 1) then
        pet:delMod(MOD_AUTO_HEALING_THRESHOLD, 10);
    end
end
