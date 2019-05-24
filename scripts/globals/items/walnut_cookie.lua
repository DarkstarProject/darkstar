-----------------------------------------
-- ID: 5922
-- Item: Walnut Cookie
-- Food Effect: 3 Min, All Races
-----------------------------------------
-- HP Healing 3
-- MP Healing 6
-- Bird Killer 10
-- Resist Paralyze 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5922)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.MPHEAL, 6)
    target:addMod(dsp.mod.BIRD_KILLER, 10)
    target:addMod(dsp.mod.PARALYZERES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.MPHEAL, 6)
    target:delMod(dsp.mod.BIRD_KILLER, 10)
    target:delMod(dsp.mod.PARALYZERES, 10)
end
