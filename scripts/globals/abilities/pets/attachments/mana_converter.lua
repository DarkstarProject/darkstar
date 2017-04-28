-----------------------------------
-- Attachment: Mana Converter
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
    local maneuvers = master and master:countEffect(EFFECT_DARK_MANEUVER) or 0
    local mpthreshold = -1
    if maneuvers == 1 then
        mpthreshold = 40
    elseif maneuvers == 2 then
        mpthreshold = 60
    elseif maneuvers == 3 then
        mpthreshold = 65
    end
    local mpp = (pet:getMaxMP() > 0) and math.ceil(pet:getMP()/pet:getMaxMP() * 100) or 100
    if mpp < mpthreshold and pet:getLocalVar("convert") < VanadielTime() then
        pet:setLocalVar("convert", VanadielTime() + 180)
        return 1948, pet
    else
        return 0
    end
end
