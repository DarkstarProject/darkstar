-----------------------------------------
-- ID: 4590
-- Item: Salmon Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +10
-- Dex +2
-- Vit +2
-- Mnd -1
-- hHP +1
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +40
-- Def +40
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4590)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.HPHEAL, 1)
end