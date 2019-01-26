-----------------------------------------
-- ID: 4543
-- Item: goblin_mushpot
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Mind 10
-- Charisma -5
-- Poison Resist 4
-- Blind Resist 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4543)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MND, 10)
    target:addMod(dsp.mod.CHR, -5)
    target:addMod(dsp.mod.POISONRES, 4)
    target:addMod(dsp.mod.BLINDRES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MND, 10)
    target:delMod(dsp.mod.CHR, -5)
    target:delMod(dsp.mod.POISONRES, 4)
    target:delMod(dsp.mod.BLINDRES, 4)
end
