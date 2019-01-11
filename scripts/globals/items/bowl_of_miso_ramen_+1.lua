-----------------------------------------
-- ID: 6461
-- Item: bowl_of_miso_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +105
-- STR +6
-- VIT +6
-- DEF +11% (cap 175)
-- Magic Evasion +11% (cap 55)
-- Magic Def. Bonus +6
-- Resist Slow +15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6461)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 105)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.FOOD_DEFP, 11)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 175)
    -- target:addMod(dsp.mod.FOOD_MEVAP, 11)
    -- target:addMod(dsp.mod.FOOD_MEVA_CAP, 55)
    target:addMod(dsp.mod.MDEF, 6)
    target:addMod(dsp.mod.SLOWRES, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 105)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.FOOD_DEFP, 11)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 175)
    -- target:delMod(dsp.mod.FOOD_MEVAP, 11)
    -- target:delMod(dsp.mod.FOOD_MEVA_CAP, 55)
    target:delMod(dsp.mod.MDEF, 6)
    target:delMod(dsp.mod.SLOWRES, 15)
end
