-----------------------------------
-- Attachment: Reactive Shield
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
    if master and master:countEffect(EFFECT_FIRE_MANEUVER) > 0 and pet:getLocalVar("blazespikes") < VanadielTime() then
        pet:setLocalVar("blazespikes", VanadielTime() + 65)
        return 2031, pet
    else
        return 0
    end
end
