-----------------------------------------
-- ID: 4281
-- Item: red_hot_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- HP Recovered While Healing 9
-- Beast Killer 12
-- Resist Sleep 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,4281)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 9)
    target:addMod(dsp.mod.BEAST_KILLER, 12)
    target:addMod(dsp.mod.SLEEPRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 9)
    target:delMod(dsp.mod.BEAST_KILLER, 12)
    target:delMod(dsp.mod.SLEEPRES, 12)
end
