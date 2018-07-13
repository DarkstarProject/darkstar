-----------------------------------------
-- ID: 15451
-- Item: Culinarian's Belt
-- Enchantment: Synthesis image support
-- 2Min, All Races
-----------------------------------------
-- Enchantment: Synthesis image support
-- Duration: 2Min
-- Alchemy Skill +3
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.COOKING_IMAGERY) == true) then
        result = 243;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COOKING_IMAGERY,3,0,120);
end;

function onEffectGain(target,effect)
    target:addMod(dsp.mod.COOK, 1);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.COOK, 1);
end;
