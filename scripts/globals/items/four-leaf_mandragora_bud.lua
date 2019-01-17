-----------------------------------------
-- ID: 4369
-- Item: four-leaf_mandragora_bud
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Agility 3
-- Vitality -5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4369)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -5)
end
