-----------------------------------------
-- ID: 15448
-- Item: Tanners belt
-- Enchantment: Synthesis image support
-- 2Min, All Races
-----------------------------------------
-- Enchantment: Synthesis image support
-- Duration: 2Min
-- Leathercraft Skill +3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY) == true) then
        result = 240
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY,3,0,120)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.LEATHER, 1)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.LEATHER, 1)
end
