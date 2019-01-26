-----------------------------------------
-- ID: 4520
-- Item: coin_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Magic Regen While Healing 6
-- Vermin Killer 12
-- Poison Resist 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4520)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MPHEAL, 6)
    target:addMod(dsp.mod.VERMIN_KILLER, 12)
    target:addMod(dsp.mod.POISONRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 6)
    target:delMod(dsp.mod.VERMIN_KILLER, 12)
    target:delMod(dsp.mod.POISONRES, 12)
end
