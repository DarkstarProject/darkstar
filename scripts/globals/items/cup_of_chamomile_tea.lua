-----------------------------------------
-- ID: 4603
-- Item: cup_of_chamomile_tea
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 8
-- Vitality -2
-- Charisma 2
-- Magic Regen While Healing 1
-- Sleep resistance -30
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4603)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 8)
    target:addMod(dsp.mod.VIT, -2)
    target:addMod(dsp.mod.CHR, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.SLEEPRES, -30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 8)
    target:delMod(dsp.mod.VIT, -2)
    target:delMod(dsp.mod.CHR, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.SLEEPRES, -30)
end
