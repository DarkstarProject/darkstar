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
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_ALCHEMY_IMAGERY) == true) then
        result = 242;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_ALCHEMY_IMAGERY,3,0,120);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SKILL_ALC, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_SKILL_ALC, 1);
end;