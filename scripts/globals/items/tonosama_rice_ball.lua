-----------------------------------------
-- ID: 4277
-- Item: Tonosama Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +15
-- Dex +3
-- Vit +3
-- Chr +3
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +50
-- Def +30
-- Double Attack +1%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4277)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 15)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.CHR, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 15)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.CHR, 3)
end