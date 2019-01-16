-----------------------------------------
-- ID: 5738
-- Item: chunk_of_sweet_lizard
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 5
-- MP 5
-- Dexterity 1
-- hHP +2
-- hMP +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5738)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 5)
    target:addMod(dsp.mod.MP, 5)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 5)
    target:delMod(dsp.mod.MP, 5)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
end
