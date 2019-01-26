-----------------------------------------
-- ID: 6274
-- Item: pukatrice_egg
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +15
-- MP +15
-- STR +2
-- Fire resistance +20
-- Attack +20% (cap 85)
-- Ranged Attack +20% (cap 85)
-- Subtle Blow +8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6274)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 15)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.FIRERES, 20)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:addMod(dsp.mod.SUBTLE_BLOW, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 15)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.FIRERES, 20)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:delMod(dsp.mod.SUBTLE_BLOW, 8)
end
