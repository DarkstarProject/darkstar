-----------------------------------------
-- ID: 6275
-- Item: pukatrice_egg_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +20
-- MP +20
-- STR +3
-- Fire resistance +21
-- Attack +21% (cap 90)
-- Ranged Attack +21% (cap 90)
-- Subtle Blow +9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6275)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.FIRERES, 21)
    target:addMod(dsp.mod.FOOD_ATTP, 21)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:addMod(dsp.mod.FOOD_RATTP, 21)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 90)
    target:addMod(dsp.mod.SUBTLE_BLOW, 9)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.FIRERES, 21)
    target:delMod(dsp.mod.FOOD_ATTP, 21)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:delMod(dsp.mod.FOOD_RATTP, 21)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 90)
    target:delMod(dsp.mod.SUBTLE_BLOW, 9)
end
