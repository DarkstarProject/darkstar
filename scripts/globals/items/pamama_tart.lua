-----------------------------------------
-- ID: 4563
-- Item: pamama_tart
-- Food Effect: 1hour, All Races
-----------------------------------------
-- HP 10
-- MP 10
-- Dexterity -1
-- Intelligence 3
-- MP Recovered While Healing 2
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4563);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MPHEAL, 2);
end;
