-----------------------------------
-- Attachment: Reactive Shield
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REACTIVE_SHIELD", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(EFFECT_FIRE_MANEUVER) > 0 and automaton:getLocalVar("blazespikes") < VanadielTime() then
            automaton:useMobAbility(2031, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_REACTIVE_SHIELD")
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
