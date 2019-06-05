-----------------------------------------
-- ID: 6465
-- Item: behemoth_steak_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +45
-- STR +8
-- DEX +8
-- INT -4
-- Attack +24% (cap 165)
-- Ranged Attack +24% (cap 165)
-- Triple Attack +2%
-- Lizard Killer +5
-- hHP +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,6465)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 45)
    target:addMod(dsp.mod.STR, 8)
    target:addMod(dsp.mod.DEX, 8)
    target:addMod(dsp.mod.INT, -4)
    target:addMod(dsp.mod.FOOD_ATTP, 24)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 165)
    target:addMod(dsp.mod.FOOD_RATTP, 24)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 165)
    target:addMod(dsp.mod.TRIPLE_ATTACK, 2)
    target:addMod(dsp.mod.LIZARD_KILLER, 5)
    target:addMod(dsp.mod.HPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 45)
    target:delMod(dsp.mod.STR, 8)
    target:delMod(dsp.mod.DEX, 8)
    target:delMod(dsp.mod.INT, -4)
    target:delMod(dsp.mod.FOOD_ATTP, 24)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 165)
    target:delMod(dsp.mod.FOOD_RATTP, 24)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 165)
    target:delMod(dsp.mod.TRIPLE_ATTACK, 2)
    target:delMod(dsp.mod.LIZARD_KILLER, 5)
    target:delMod(dsp.mod.HPHEAL, 5)
end
