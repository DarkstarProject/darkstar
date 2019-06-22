-----------------------------------------
-- ID: 4268
-- Item: plate_of_sea_spray_risotto
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 45
-- Dexterity 6
-- Agility 3
-- Mind -4
-- HP Recovered While Healing 1
-- Accuracy % 6 (cap 20)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4268)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 45)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.MND, -4)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ACCP, 6)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 45)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.MND, -4)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ACCP, 6)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 20)
end
