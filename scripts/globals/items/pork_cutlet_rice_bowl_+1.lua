-----------------------------------------
-- ID: 6407
-- Item: pork_cutlet_rice_bowl_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +65
-- MP +65
-- STR +8
-- VIT +4
-- AGI +6
-- INT -8
-- Fire resistance +21
-- Attack +24% (cap 130)
-- Ranged Attack +24% (cap 130)
-- Store TP +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,6407)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 65)
    target:addMod(dsp.mod.MP, 65)
    target:addMod(dsp.mod.STR, 8)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.AGI, 6)
    target:addMod(dsp.mod.INT, -8)
    target:addMod(dsp.mod.FIRERES, 21)
    target:addMod(dsp.mod.FOOD_ATTP, 24)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 130)
    target:addMod(dsp.mod.FOOD_RATTP, 24)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 130)
    target:addMod(dsp.mod.STORETP, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 65)
    target:delMod(dsp.mod.MP, 65)
    target:delMod(dsp.mod.STR, 8)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.AGI, 6)
    target:delMod(dsp.mod.INT, -8)
    target:delMod(dsp.mod.FIRERES, 21)
    target:delMod(dsp.mod.FOOD_ATTP, 24)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 130)
    target:delMod(dsp.mod.FOOD_RATTP, 24)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 130)
    target:delMod(dsp.mod.STORETP, 5)
end
