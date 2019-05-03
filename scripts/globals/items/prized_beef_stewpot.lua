-----------------------------------------
-- ID: 5549
-- Item: Prized Angler's Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 100
-- MP +20
-- Strength +4
-- Agility +2
-- Mind +2
-- HP Recovered while healing +9
-- MP Recovered while healing +3
-- Attack 18% Cap 80
-- Evasion +7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5549)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 100)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.HPHEAL, 9)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:addMod(dsp.mod.EVA, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 100)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.HPHEAL, 9)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:delMod(dsp.mod.EVA, 7)
end
