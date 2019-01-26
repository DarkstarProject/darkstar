-----------------------------------------
-- ID: 6464
-- Item: behemoth_steak
-- Food Effect: 180Min, All Races
-----------------------------------------
-- HP +40
-- STR +7
-- DEX +7
-- INT -3
-- Attack +23% (cap 160)
-- Ranged Attack +23% (cap 160)
-- Triple Attack +1%
-- Lizard Killer +4
-- hHP +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6464)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.DEX, 7)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:addMod(dsp.mod.TRIPLE_ATTACK, 1)
    target:addMod(dsp.mod.LIZARD_KILLER, 4)
    target:addMod(dsp.mod.HPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.DEX, 7)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:delMod(dsp.mod.TRIPLE_ATTACK, 1)
    target:delMod(dsp.mod.LIZARD_KILLER, 4)
    target:delMod(dsp.mod.HPHEAL, 4)
end
