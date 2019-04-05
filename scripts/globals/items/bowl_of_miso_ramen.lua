-----------------------------------------
-- ID: 6460
-- Item: bowl_of_miso_ramen
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +100
-- STR +5
-- VIT +5
-- DEF +10% (cap 170)
-- Magic Evasion +10% (cap 50)
-- Magic Def. Bonus +5
-- Resist Slow +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6460)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 100)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.FOOD_DEFP, 10)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 170)
    -- target:addMod(dsp.mod.FOOD_MEVAP, 10)
    -- target:addMod(dsp.mod.FOOD_MEVA_CAP, 50)
    target:addMod(dsp.mod.MDEF, 5)
    target:addMod(dsp.mod.SLOWRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 100)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.FOOD_DEFP, 10)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 170)
    -- target:delMod(dsp.mod.FOOD_MEVAP, 10)
    -- target:delMod(dsp.mod.FOOD_MEVA_CAP, 50)
    target:delMod(dsp.mod.MDEF, 5)
    target:delMod(dsp.mod.SLOWRES, 10)
end
