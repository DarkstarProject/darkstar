-----------------------------------------
-- ID: 5862
-- Item: galkan_sausage_-1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength -3
-- Dexterity -3
-- Vitality -3
-- Agility -3
-- Mind -3
-- Intelligence -3
-- Charisma -3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5862)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, -3)
    target:addMod(dsp.mod.DEX, -3)
    target:addMod(dsp.mod.VIT, -3)
    target:addMod(dsp.mod.AGI, -3)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.CHR, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, -3)
    target:delMod(dsp.mod.DEX, -3)
    target:delMod(dsp.mod.VIT, -3)
    target:delMod(dsp.mod.AGI, -3)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.CHR, -3)
end
