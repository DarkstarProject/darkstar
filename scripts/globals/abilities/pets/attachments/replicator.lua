-----------------------------------
-- Attachment: Replicator
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
    local hpthreshold = (pet:getLocalVar("damagegauge") > 0) and 75 or 50
    if master and master:countEffect(EFFECT_WIND_MANEUVER) > 0 and pet:getHPP() <= hpthreshold and not pet:hasStatusEffect(EFFECT_BLINK) and pet:getLocalVar("blink") < VanadielTime() then
        pet:setLocalVar("blink", VanadielTime() + 60)
        return 2132, pet
    else
        return 0
    end
end
