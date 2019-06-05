-----------------------------------------
-- ID: 5169
-- Item: Bataquiche +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 10
-- Agility 1
-- Vitality -1
-- Ranged Acc % 7
-- Ranged Acc Cap 20
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5169)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.FOOD_RACCP, 7)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.FOOD_RACCP, 7)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 20)
end
