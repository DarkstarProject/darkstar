-----------------------------------
-- Attachment: Flashbulb
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_FLASHBULB", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(dsp.effects.LIGHT_MANEUVER) > 0 and automaton:getLocalVar("flash") < VanadielTime() and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(1947)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_FLASHBULB", function(automaton, target)
	end)
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
