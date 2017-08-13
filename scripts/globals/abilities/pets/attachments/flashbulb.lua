-----------------------------------
-- Attachment: Flashbulb
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
    if master and master:countEffect(EFFECT_LIGHT_MANEUVER) > 0 and pet:getLocalVar("flash") < VanadielTime() and (pet:checkDistance(target) - target:getModelSize()) < 7 then
        pet:setLocalVar("flash", VanadielTime() + 45)
        return 1947
    else
        return 0
    end
end
