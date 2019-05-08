-----------------------------------------
-- ID: 4286
-- Item: cup_of_healing_tea
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic 10
-- Vitality -1
-- Charisma 3
-- Magic Regen While Healing 2
-- Sleep resistance -40
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4286)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.CHR, 3)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.SLEEPRES, -40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.CHR, 3)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.SLEEPRES, -40)
end
