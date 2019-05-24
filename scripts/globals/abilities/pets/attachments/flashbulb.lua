-----------------------------------
-- Attachment: Flashbulb
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_FLASHBULB", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(dsp.recast.ABILITY, 1947) and master and master:countEffect(dsp.effect.LIGHT_MANEUVER) > 0 and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(1947)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_FLASHBULB")
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
