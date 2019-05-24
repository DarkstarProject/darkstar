-----------------------------------------
-- ID: 6406
-- Item: pork_cutlet_rice_bowl
-- Food Effect: 180Min, All Races
-----------------------------------------
-- HP +60
-- MP +60
-- STR +7
-- VIT +3
-- AGI +5
-- INT -7
-- Fire resistance +20
-- Attack +23% (cap 125)
-- Ranged Attack +23% (cap 125)
-- Store TP +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6406)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 60)
    target:addMod(dsp.mod.MP, 60)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.INT, -7)
    target:addMod(dsp.mod.FIRERES, 20)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 125)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 125)
    target:addMod(dsp.mod.STORETP, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 60)
    target:delMod(dsp.mod.MP, 60)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.INT, -7)
    target:delMod(dsp.mod.FIRERES, 20)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 125)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 125)
    target:delMod(dsp.mod.STORETP, 4)
end
