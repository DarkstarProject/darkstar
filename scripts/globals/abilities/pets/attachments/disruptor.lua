-----------------------------------
-- Attachment: Disruptor
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_DISRUPTOR", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(EFFECT_DARK_MANEUVER) > 0 and automaton:getLocalVar("dispel") < VanadielTime() and target:hasStatusEffectByFlag(EFFECTFLAG_DISPELABLE) and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(2747)
        else
            return 0
        end
    end)
end

function onUnequip(pet)
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
