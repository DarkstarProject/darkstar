-----------------------------------------
-- ID: 4275
-- Item: serving_of_emperor_roe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 8
-- Magic 8
-- Dexterity 4
-- Mind -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4275)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 8)
    target:addMod(dsp.mod.MP, 8)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MND, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 8)
    target:delMod(dsp.mod.MP, 8)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MND, -4)
end
