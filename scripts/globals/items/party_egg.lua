-----------------------------------------
-- ID: 4595
-- Item: party_egg
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 25
-- Magic 25
-- Attack 5
-- Ranged Attack 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4595)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.MP, 25)
    target:addMod(dsp.mod.ATT, 5)
    target:addMod(dsp.mod.RATT, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.MP, 25)
    target:delMod(dsp.mod.ATT, 5)
    target:delMod(dsp.mod.RATT, 4)
end
