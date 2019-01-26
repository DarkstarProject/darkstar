-----------------------------------------
-- ID: 5560
-- Item: Serving of Elysian Eclair
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10
-- MP +15
-- Intelligence +2
-- HP Recoverd while healing 2
-- MP Recovered while healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5560)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
end
