-----------------------------------
-- Attachment: Eraser
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

local removable = {
    EFFECT_PETRIFICATION,
    EFFECT_SILENCE,
    EFFECT_BANE,
    EFFECT_CURSE_II,
    EFFECT_CURSE,
    EFFECT_PARALYSIS,
    EFFECT_PLAGUE,
    EFFECT_POISON,
    EFFECT_DISEASE,
    EFFECT_BLINDNESS
}

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
    if master and master:countEffect(EFFECT_LIGHT_MANEUVER) > 0 and pet:getLocalVar("erase") < VanadielTime() then
        local erasetarget = false

        local function checkEffects(entity)
            for _,status in pairs(removable) do
                if entity:hasStatusEffect(status) then return true end
            end
            return false
        end

        if pet:hasStatusEffectByFlag(EFFECTFLAG_ERASABLE) or checkEffects(pet) then
            erasetarget = pet
        elseif (pet:checkDistance(master) - master:getModelSize()) < 7 and (master:hasStatusEffectByFlag(EFFECTFLAG_ERASABLE) or checkEffects(master)) then
            erasetarget = master
        end

        if not erasetarget then return 0 end
        pet:setLocalVar("erase", VanadielTime() + 30)
        return 2021, erasetarget
    else
        return 0
    end
end
