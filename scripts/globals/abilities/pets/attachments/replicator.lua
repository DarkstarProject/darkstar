-----------------------------------
-- Attachment: Replicator
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REPLICATOR", function(automaton, target)
        local master = automaton:getMaster()
        local hpthreshold = (automaton:getLocalVar("damagegauge") > 0) and 75 or 50
        if master and master:countEffect(EFFECT_WIND_MANEUVER) > 0 and automaton:getHPP() <= hpthreshold and not automaton:hasStatusEffect(EFFECT_BLINK) and automaton:getLocalVar("blink") < VanadielTime() then
            automaton:useMobAbility(2132, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_REPLICATOR")
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
