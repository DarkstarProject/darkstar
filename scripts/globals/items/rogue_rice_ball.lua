-----------------------------------------
-- ID: 4604
-- Item: Rogue Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +12
-- Vit +3
-- hHP +2
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Def +50
-- Beast Killer (guesstimated 5%)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4604)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
end