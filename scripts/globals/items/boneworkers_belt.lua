-----------------------------------------
-- ID: 15449
-- Item: Boneworker's belt
-- Enchantment: Synthesis image support
-- 2Min, All Races
-----------------------------------------
-- Enchantment: Synthesis image support
-- Duration: 2Min
-- Bonecraft Skill +3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.BONECRAFT_IMAGERY) == true) then
        result = 241
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.BONECRAFT_IMAGERY,3,0,120)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.BONE, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.BONE, 1)
end