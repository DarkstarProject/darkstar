-----------------------------------
-- Attachment: Eraser
-----------------------------------
require("scripts/globals/status");

local removable = {
    EFFECT.PETRIFICATION,
    EFFECT.SILENCE,
    EFFECT.BANE,
    EFFECT.CURSE_II,
    EFFECT.CURSE,
    EFFECT.PARALYSIS,
    EFFECT.PLAGUE,
    EFFECT.POISON,
    EFFECT.DISEASE,
    EFFECT.BLINDNESS
}

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_ERASER", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(EFFECT.LIGHT_MANEUVER) > 0 and automaton:getLocalVar("erase") < VanadielTime() then
            local erasetarget = false

            local function checkEffects(entity)
                for _,status in pairs(removable) do
                    if entity:hasStatusEffect(status) then return true end
                end
                return false
            end

            if automaton:hasStatusEffectByFlag(EFFECTFLAG_ERASABLE) or checkEffects(automaton) then
                erasetarget = automaton
            elseif (automaton:checkDistance(master) - master:getModelSize()) < 7 and (master:hasStatusEffectByFlag(EFFECTFLAG_ERASABLE) or checkEffects(master)) then
                erasetarget = master
            end

            if not erasetarget then return 0 end
            automaton:useMobAbility(2021, erasetarget)
        else
            return 0
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_ERASER")
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
