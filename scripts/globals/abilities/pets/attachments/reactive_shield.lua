-----------------------------------
-- Attachment: Reactive Shield
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REACTIVE_SHIELD", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(dsp.recast.ABILITY, 2031) and master and master:countEffect(dsp.effect.FIRE_MANEUVER) > 0 then
            automaton:useMobAbility(2031, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_REACTIVE_SHIELD")
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
