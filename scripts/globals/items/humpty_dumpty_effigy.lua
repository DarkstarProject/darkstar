-----------------------------------------
-- ID: 5683
-- Item: humpty_dumpty_effigy
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Max HP % 6
-- Max MP % 6
-- HP recovered while healing 10
-- MP recovered while healing 10 (unconfirmed)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5683);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 999);
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 999);
    target:addMod(MOD_HPHEAL, 10);
    target:addMod(MOD_MPHEAL, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPP, 6);
    target:delMod(MOD_MPP, 6);
    target:delMod(MOD_HPHEAL, 10);
    target:delMod(MOD_MPHEAL, 10);
end;
