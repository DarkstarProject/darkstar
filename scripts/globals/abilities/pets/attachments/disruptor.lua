-----------------------------------
-- Attachment: Disruptor
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
    if master and master:countEffect(EFFECT_DARK_MANEUVER) > 0 and pet:getLocalVar("dispel") < VanadielTime() and target:hasStatusEffectByFlag(EFFECTFLAG_DISPELABLE) and (pet:checkDistance(target) - target:getModelSize()) < 7 then
        pet:setLocalVar("dispel", VanadielTime() + 60)
        return 2747
    else
        return 0
    end
end
