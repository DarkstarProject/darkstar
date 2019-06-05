-----------------------------------------
-- ID: 5928
-- Item: Himesama Rice Ball
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- HP +25
-- Dexterity +4
-- Vitality +4
-- Character +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +1%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5928)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.CHR, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.CHR, 4)
end