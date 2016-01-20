-----------------------------------------
-- ID: 5859
-- Item: galkan_sausage_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 4
-- Intelligence -5
-- Attack 10
-- Ranged Attack 10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5859);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_INT, -5);
    target:addMod(MOD_ATT, 10);
    target:addMod(MOD_RATT, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_INT, -5);
    target:delMod(MOD_ATT, 10);
    target:delMod(MOD_RATT, 10);
end;
