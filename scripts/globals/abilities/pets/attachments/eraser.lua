-----------------------------------
-- Attachment: Eraser
-----------------------------------
require("scripts/globals/status")
-----------------------------------

local removable = {
    dsp.effect.PETRIFICATION,
    dsp.effect.SILENCE,
    dsp.effect.BANE,
    dsp.effect.CURSE_II,
    dsp.effect.CURSE,
    dsp.effect.PARALYSIS,
    dsp.effect.PLAGUE,
    dsp.effect.POISON,
    dsp.effect.DISEASE,
    dsp.effect.BLINDNESS
}

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_ERASER", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(dsp.recast.ABILITY, 2021) and master and master:countEffect(dsp.effect.LIGHT_MANEUVER) > 0 then
            local erasetarget = false

            local function checkEffects(entity)
                for _, status in pairs(removable) do
                    if entity:hasStatusEffect(status) then return true end
                end
                return false
            end

            if automaton:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) or checkEffects(automaton) then
                erasetarget = automaton
            elseif (automaton:checkDistance(master) - master:getModelSize()) < 7 and (master:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) or checkEffects(master)) then
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

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
