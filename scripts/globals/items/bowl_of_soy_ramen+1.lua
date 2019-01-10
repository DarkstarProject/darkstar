-----------------------------------------
-- ID: 6459
-- Item: bowl_of_soy_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +55
-- STR +6
-- VIT +6
-- AGI +4
-- Attack +11% (cap 175)
-- Ranged Attack +11% (cap 175)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6459)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 55)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.FOOD_ATTP, 11)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 175)
    target:addMod(dsp.mod.FOOD_RATTP, 11)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 175)
    target:addMod(dsp.mod.SLOWRES, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 55)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.FOOD_ATTP, 11)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 175)
    target:delMod(dsp.mod.FOOD_RATTP, 11)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 175)
    target:delMod(dsp.mod.SLOWRES, 15)
end
