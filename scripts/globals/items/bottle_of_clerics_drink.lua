-----------------------------------------
-- ID: 5395
-- Item: Bottle of Cleric's Drink
-- Item Effect: Removes most status ailments AoE
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:forMembersInRange(10, function(member)
        local removedCount = 0
        local removable =
        {
            dsp.effect.PETRIFICATION,
            dsp.effect.SILENCE,
            dsp.effect.BIND,
            dsp.effect.BANE,
            dsp.effect.CURSE_II,
            dsp.effect.CURSE,
            dsp.effect.PARALYSIS,
            dsp.effect.PLAGUE,
            dsp.effect.POISON,
            dsp.effect.DISEASE,
            dsp.effect.BLINDNESS
        }
        for _, status in pairs(removable) do
            if member:hasStatusEffect(status) then
                member:delStatusEffect(status)
                removedCount = removedCount + 1
            end
        end
        if member:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) then
            member:eraseStatusEffect(dsp.effectFlag.ERASABLE)
        else
            if removedCount == 0 then
                member:messageBasic(dsp.msg.basic.NO_EFFECT)
            end
        end
    end)

end