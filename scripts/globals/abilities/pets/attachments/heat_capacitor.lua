-----------------------------------
-- Attachment: Heat Capacitor
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
end

function onManeuverLose(pet,maneuvers)
end

function onAttachmentCheck(pet,target)
    local master = pet:getMaster()
    if master and master:countEffect(EFFECT_FIRE_MANEUVER) > 0 and pet:getLocalVar("meditate") < VanadielTime() then
        pet:setLocalVar("meditate", VanadielTime() + 90)
        return 2745, pet
    else
        return 0
    end
end
