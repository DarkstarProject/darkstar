-----------------------------------------
-- ID: 4466
-- Item: spicy_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Recovered While Healing 7
-- Beast Killer +10
-- Resist Sleep +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,4466)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 7)
    target:addMod(dsp.mod.BEAST_KILLER, 10)
    target:addMod(dsp.mod.SLEEPRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 7)
    target:delMod(dsp.mod.BEAST_KILLER, 10)
    target:delMod(dsp.mod.SLEEPRES, 10)
end
