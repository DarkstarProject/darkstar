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
 
require("scripts/globals/status");
 
-----------------------------------------
-- OnItemCheck
-----------------------------------------
 
function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY) == true) then
        result = 240;
    end
    return result;
end;
 
-----------------------------------------
-- OnItemUse
-----------------------------------------
 
function onItemUse(target)
    target:addStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY,3,0,120);
end;
 
-----------------------------------------
-- onEffectGain Action
-----------------------------------------
 
function onEffectGain(target,effect)
    target:addMod(MOD_SKILL_LTH, 1);
end;
 
-----------------------------------------
-- onEffectLose Action
-----------------------------------------
 
function onEffectLose(target,effect)
    target:delMod(MOD_SKILL_LTH, 1);
end;