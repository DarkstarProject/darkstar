-----------------------------------------
-- ID: 4278
-- Item: Shogun Rice Ball
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +20
-- Dex +4
-- Vit +4
-- Chr +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +50
-- Def +30
-- Double Attack +5%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4278)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.CHR, 4)

end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.CHR, 4)
end