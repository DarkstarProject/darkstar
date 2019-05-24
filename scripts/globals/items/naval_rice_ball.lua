-----------------------------------------
-- ID: 4605
-- Item: Naval Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +12
-- Dex +3
-- Vit +3
-- hHP +2
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +40
-- Def +40
-- Arcana Killer (guesstimated 5%)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4605)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
end