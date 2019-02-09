-----------------------------------------
-- ID: 5942
-- Item: Piece of Cascade Candy
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind +4
-- Charisma +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5942)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.CHR, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.CHR, 4)
end
