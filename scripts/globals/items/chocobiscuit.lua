-----------------------------------------
-- ID: 5934
-- Item: Chocobiscuit
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 3
-- Charisma 3
-- Evasion 2
-- Aquan Killer 10
-- Silence Resist 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5934)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.CHR, 3)
    target:addMod(dsp.mod.EVA, 2)
    target:addMod(dsp.mod.AQUAN_KILLER, 10)
    target:addMod(dsp.mod.SILENCERES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.CHR, 3)
    target:delMod(dsp.mod.EVA, 2)
    target:delMod(dsp.mod.AQUAN_KILLER, 10)
    target:delMod(dsp.mod.SILENCERES, 10)
end
