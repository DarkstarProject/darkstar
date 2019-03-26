-----------------------------------
-- Attachment: Heat Capacitor II
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("heat_capacitor", pet:getLocalVar("heat_capacitor") + 2)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_HEAT_CAPACITOR_II", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(dsp.effect.FIRE_MANEUVER) > 0 and automaton:getLocalVar("meditate") < VanadielTime() then
            automaton:useMobAbility(2745, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:setLocalVar("heat_capacitor", pet:getLocalVar("heat_capacitor") - 2)
    pet:removeListener("ATTACHMENT_HEAT_CAPACITOR_II")
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end