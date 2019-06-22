-----------------------------------------
-- ID: 15447
-- Item: Weaver's Belt
-- Enchantment: Synthesis image support
-- 2Min, All Races
-----------------------------------------
-- Enchantment: Synthesis image support
-- Duration: 2Min
-- Clothcraft Skill +3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.CLOTHCRAFT_IMAGERY) == true) then
        result = 239
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.CLOTHCRAFT_IMAGERY,3,0,120)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.CLOTH, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.CLOTH, 1)
end
