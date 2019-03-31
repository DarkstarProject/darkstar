-----------------------------------
-- Attachment: Shock Absorber
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("stoneskin", VanadielTime() + 180)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") + 1)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_SHOCK_ABSORBER", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(dsp.recast.ABILITY, 1946) and master and master:countEffect(dsp.effect.EARTH_MANEUVER) > 0 and automaton:getLocalVar("stoneskin") < VanadielTime() then
            automaton:useMobAbility(1946, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") - 1)
    pet:removeListener("ATTACHMENT_SHOCK_ABSORBER")
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
