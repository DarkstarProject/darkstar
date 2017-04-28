-----------------------------------
-- Attachment: Shock Absorber
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("stoneskin", VanadielTime() + 180)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") + 1)
end

function onUnequip(pet)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") - 1)
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end

function onAttachmentCheck(pet,target)
    local master = pet:getMaster()
    if master and master:countEffect(EFFECT_EARTH_MANEUVER) > 0 and pet:getLocalVar("stoneskin") < VanadielTime() then
        pet:setLocalVar("stoneskin", VanadielTime() + 180)
        return 1946, pet
    else
        return 0
    end
end
