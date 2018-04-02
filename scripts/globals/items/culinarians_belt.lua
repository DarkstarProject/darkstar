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
    if (target:hasStatusEffect(dsp.effects.COOKING_IMAGERY) == true) then
        result = 243;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.COOKING_IMAGERY,3,0,120);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SKILL_COK, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_SKILL_COK, 1);
end;