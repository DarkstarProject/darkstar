-----------------------------------------
-- ID: 17826
-- Item: Messhikimaru
-- Enchantment: Arcana Killer
-- Durration: 10 Mins
-----------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    result = 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == false) then
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,600,17826)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ARCANA_KILLER, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ARCANA_KILLER, 20)
end

