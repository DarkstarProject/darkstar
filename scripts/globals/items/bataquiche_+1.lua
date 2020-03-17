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
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD,0,0,3600,5169)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.MP, 10)
    target:addMod(tpz.mod.AGI, 1)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.FOOD_RACCP, 7)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 20)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MP, 10)
    target:delMod(tpz.mod.AGI, 1)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.FOOD_RACCP, 7)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 20)
end
