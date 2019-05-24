-----------------------------------------
-- ID: 5718
-- Item: Cream Puff
-- Food Effect: 30 mintutes, All Races
-----------------------------------------
-- Intelligence +7
-- HP -10
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
   target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5718)
end

function onEffectGain(target,effect)
   target:addMod(dsp.mod.INT, 7)
   target:addMod(dsp.mod.HP, -10)
end

function onEffectLose(target, effect)
   target:delMod(dsp.mod.INT, 7)
   target:delMod(dsp.mod.HP, -10)
end
