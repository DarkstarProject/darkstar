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

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_BONECRAFT_IMAGERY) == true) then
        result = 241;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_BONECRAFT_IMAGERY,3,0,120);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SKILL_BON, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_SKILL_BON, 1);
end;