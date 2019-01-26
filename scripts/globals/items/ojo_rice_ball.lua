-----------------------------------------
-- ID: 5929
-- Item: Ojo Rice Ball
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- HP +50
-- Dexterity +5
-- Vitality +5
-- Character +5
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +2%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5929)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 50)
    target:addMod(dsp.mod.DEX, 5)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.CHR, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 50)
    target:delMod(dsp.mod.DEX, 5)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.CHR, 5)
end