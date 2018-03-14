-----------------------------------
-- Attachment: Heat Capacitor
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_HEAT_CAPACITOR", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(EFFECT_FIRE_MANEUVER) > 0 and automaton:getLocalVar("meditate") < VanadielTime() then
            automaton:useMobAbility(2745, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_HEAT_CAPACITOR")
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
