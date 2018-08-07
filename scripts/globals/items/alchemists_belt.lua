-----------------------------------------
-- ID: 15450
-- Item: Alchemist's belt
-- Enchantment: Synthesis image support
-- 2Min, All Races
-----------------------------------------
-- Enchantment: Synthesis image support
-- Duration: 2Min
-- Alchemy Skill +3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.ALCHEMY_IMAGERY) == true) then
        result = 242
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ALCHEMY_IMAGERY,3,0,120)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ALCHEMY, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ALCHEMY, 1)
end