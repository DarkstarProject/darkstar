-----------------------------------------
-- ID: 5967
-- Item: Verboshroom
-- Food Effect: 3 Mins, All Races
-- Poison 2HP / 3Tic
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5967)
    if (not target:hasStatusEffect(dsp.effect.POISON)) then
        target:addStatusEffect(dsp.effect.POISON,2,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
