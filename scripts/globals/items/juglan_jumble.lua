-----------------------------------------
-- ID: 5923
-- Item: Juglan Jumble
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- HP Healing 5
-- MP Healing 8
-- Bird Killer 12
-- Resist Paralyze 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5923)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.MPHEAL, 8)
    target:addMod(dsp.mod.BIRD_KILLER, 12)
    target:addMod(dsp.mod.PARALYZERES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.MPHEAL, 8)
    target:delMod(dsp.mod.BIRD_KILLER, 12)
    target:delMod(dsp.mod.PARALYZERES, 12)
end
