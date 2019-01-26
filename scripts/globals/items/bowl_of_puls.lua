-----------------------------------------
-- ID: 4492
-- Item: bowl_of_puls
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Vitality 2
-- Dexterity -1
-- HP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4492)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.HPHEAL, 3)
end
