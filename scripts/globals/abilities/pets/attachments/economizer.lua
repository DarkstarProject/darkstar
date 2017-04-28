-----------------------------------
-- Attachment: Economizer
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
    local maneuvers = (master and master:countEffect(EFFECT_DARK_MANEUVER) > 0) and master:countEffect(EFFECT_DARK_MANEUVER) or 7
    local mpthreshold = 60 - maneuvers * 10
    local mpp = (pet:getMaxMP() > 0) and math.ceil(pet:getMP()/pet:getMaxMP() * 100) or 100
    if mpp < mpthreshold and pet:getLocalVar("mprestore") < VanadielTime() then
        pet:setLocalVar("mprestore", VanadielTime() + 180)
        return 2068, pet
    else
        return 0
    end
end
