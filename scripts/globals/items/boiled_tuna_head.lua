-----------------------------------------
-- ID: 4540
-- Item: Boiled Tuna Head
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 20
-- Dexterity 3
-- Intelligence 4
-- Mind -3
-- Magic Regen While Healing 2
-- Evasion 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4540)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.EVA, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.EVA, 5)
end
