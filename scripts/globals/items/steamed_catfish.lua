-----------------------------------------
-- ID: 4557
-- Item: steamed_catfish
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 30
-- Magic % 1
-- Vitality 3
-- Intelligence 1
-- Mind -3
-- Earth Res 10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4557);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_MPP, 1);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_EARTHRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_MPP, 1);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_EARTHRES, 5);
end;
