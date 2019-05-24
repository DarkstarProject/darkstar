-----------------------------------------
-- ID: 4404
-- Item: roast_trout
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -1
-- Ranged ATT % 14 (cap 50)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4404)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.RATTP, 14)
    target:addMod(dsp.mod.RATT_CAP, 50)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.RATTP, 14)
    target:delMod(dsp.mod.RATT_CAP, 50)
end
