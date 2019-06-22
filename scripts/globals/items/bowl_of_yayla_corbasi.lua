-----------------------------------------
-- ID: 5579
-- Item: bowl_of_yayla_corbasi
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 20
-- Dexterity -1
-- Vitality 2
-- HP Recovered While Healing 3
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5579)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.MPHEAL, 1)
end
