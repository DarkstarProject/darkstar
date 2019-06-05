-----------------------------------------
-- ID: 5674
-- Item: Aileen's Delight
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +50
-- MP +50
-- STR +4
-- DEX +4
-- VIT +4
-- AGI +4
-- INT +4
-- MND +4
-- CHR +4
-- MP recovered while healing +2
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5674)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 50)
    target:addMod(dsp.mod.MP, 50)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.CHR, 4)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 50)
    target:delMod(dsp.mod.MP, 50)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.CHR, 4)
    target:delMod(dsp.mod.MPHEAL, 2)
end
